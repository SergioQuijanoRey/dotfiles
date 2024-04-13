-- First configure some luasnip behavior
local ls = require("luasnip")
local types = require "luasnip.util.types"

-- Shorthands for defining snippets
local s = ls.snippet
local sn = ls.snippet_node
local i = ls.insert_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt

-- The filetype where we want to inject the snippets
local FILETYPE = "tex"

-- Make adding new snippets easier, instead of having a gigantic table
local add_snippet = function(snippets, snippet_name, snippet_format)
    local new_snippet = s(
        snippet_name,
        snippet_format
    )
    return table.insert(snippets, new_snippet)
end

local snippets = {}

-- Easily create bullet lists
add_snippet(snippets, "list", fmt(
    [[
\begin{itemize}
    \item <>
    \item <>
    \item <>
\end{itemize}
]],
    { i(1), i(2), i(3) },
    { delimiters = "<>" }
))

-- Easily create enumerated lists
add_snippet(snippets, "elist", fmt(
    [[
\begin{enumerate}
    \item <>
    \item <>
    \item <>
\end{enumerate}
]],
    { i(1), i(2), i(3) },
    { delimiters = "<>" }
))

-- Create a definition
add_snippet(snippets, "def", fmt(
    [[
\begin{definicion}[<>]
    <>
\end{definicion}
]],
    { i(1), i(2) },
    { delimiters = "<>" }
))

-- Create a definition
add_snippet(snippets, "prop", fmt(
    [[
\begin{proposicion}[<>]
    <>
\end{proposicion}
]],
    { i(1), i(2) },
    { delimiters = "<>" }
))

-- Create an equation
add_snippet(snippets, "eq", fmt(
    [[
\begin{equation}
    <>
\end{equation}
]],
    { i(1) },
    { delimiters = "<>" }
))

-- Create an equation with splitted lines
add_snippet(snippets, "eqs", fmt(
    [[
\begin{equation}
\begin{split}
    <>
\end{split}
\end{equation}
]],
    { i(1) },
    { delimiters = "<>" }
))

-- Bold is way to hard to type every time I want to bold a text
add_snippet(snippets, "bold", fmt("\\textbf{<>}",
    { i(1) },
    { delimiters = "<>" }
))

-- The same for making text italic
add_snippet(snippets, "it", fmt("\\textit{<>}",
    { i(1) },
    { delimiters = "<>" }
))

-- I use cites a lot
add_snippet(snippets, "cite", fmt("\\cite{<>}",
    { i(1) },
    { delimiters = "<>" }
))

-- Custom command for writing vectors
add_snippet(snippets, "vec", fmt("\\nv{<>}",
    { i(1) },
    { delimiters = "<>" }
))

-- Inline code
add_snippet(snippets, "inline", fmt("\\lstinline{<>}",
    { i(1) },
    { delimiters = "<>" }
))

-- Create a figure
add_snippet(snippets, "image", fmt(
    [[
\begin{figure}[H]
    \centering
    \includegraphics[width=0.8\textwidth]{<>}
    \caption{<>}
\end{figure}
]],
    { i(1), i(2) },
    { delimiters = "<>" }
))

-- Create a figure with images side by side
add_snippet(snippets, "imagedouble", fmt(
    [[
\begin{figure}
\centering
    \begin{subfigure}{.5\textwidth}
        \centering
        \includegraphics[width=0.8\linewidth]{<>}
        \caption{<>}
    \end{subfigure}%
    \begin{subfigure}{.5\textwidth}
        \centering
        \includegraphics[width=0.8\linewidth]{<>}
        \caption{<>}
    \end{subfigure}
\caption{<>}
\end{figure}
]],
    { i(1), i(2), i(3), i(4), i(5) },
    { delimiters = "<>" }
))

-- Quickly create tables
add_snippet(snippets, "table", fmt(
    [[

\begin{table}[H]
\centering
\begin{tabular}{<>}
    \hline
    <> \\
    \hline

    <> \\

    \hline

\end{tabular}
\caption{<>}
\end{table}
]],
    { i(1, "|l|l|l|l|"), i(2, "Title1 & Title2 & Title3 & Title 4 "), i(3, "data1 & data2 & data3 & data4"),
        i(4) },
    { delimiters = "<>" }
))

-- Finally, inform lua snip that we want to set this snippets
ls.add_snippets(FILETYPE, snippets, {
    key = FILETYPE,
})
