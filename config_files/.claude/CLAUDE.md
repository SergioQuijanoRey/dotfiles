# Global Claude Code Instructions

## Code style

### Assertions

- Assert function arguments and return values, pre/postconditions and invariants when needed and when makes sense. A function should not operate blindly on data it has not checked.
- On occasion, you may use a blatantly true assertion instead of a comment as stronger documentation where the assertion condition is critical and surprising.
- Use single-line if to assert an implication: `if (a) assert(b)`.

### Naming conventions

- Follow most significant information first approach. For example, `latency_ms_max` rather than `max_latency_ms`
- When a single function calls out to a helper function or callback, prefix the name of the helper function with the name of the calling function to show the call history. For example, `read_sector()` and `read_sector_callback()`.

### Literate programming style

Follow a **literate programming style** when writing or modifying code:

- Always motivate, always say why. Never forget to say why. Because if you explain the rationale for a decision, it not only increases the hearer's understanding, and makes them more likely to adhere or comply, but it also shares criteria with them with which to evaluate the decision and its importance. Explain the **business process and the reason why** something is done, not just what it does technically
- This comments are better put in higher-level constructs (functions, modules, CTEs, pipelines, classes) but for certain decisions can be place inside the constructs.
    - Line-level comments are fine for non-obvious logic, but they should explain implementation detail, not restate what the code obviously does.
- The goal is that a reader can understand the intent and domain context from the high-level comments, and the mechanics from the low-level ones.

Examples of what to capture at the high level:
- Why this CTE or function exists in the business flow
- What invariant or rule it enforces
- What would go wrong if this step were skipped

## Writing Style

- Never use em dashes (--) or en dashes. Use commas or parentheses instead to join clauses.
- If a dash is truly needed (e.g., in a compound word or range), use the standard hyphen/minus sign (-), not typographic dashes.
