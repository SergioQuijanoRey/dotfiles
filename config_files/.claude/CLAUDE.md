# Global Claude Code Instructions

## Code Comments

Follow a **literate programming style** when writing or modifying code:

- At higher-level constructs (functions, modules, CTEs, pipelines, classes), write comments that explain the **business process and the reason why** something is done, not just what it does technically.
- Line-level comments are fine for non-obvious logic, but they should explain implementation detail, not restate what the code obviously does.
- The goal is that a reader can understand the intent and domain context from the high-level comments, and the mechanics from the low-level ones.

Examples of what to capture at the high level:
- Why this CTE or function exists in the business flow
- What invariant or rule it enforces
- What would go wrong if this step were skipped

## Writing Style

- Never use em dashes (--) or en dashes. Use commas or parentheses instead to join clauses.
- If a dash is truly needed (e.g., in a compound word or range), use the standard hyphen/minus sign (-), not typographic dashes.
