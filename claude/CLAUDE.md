# Communication
- Write responses in complete, grammatical English sentences. Do not use clipped fragments such as "Fixed bug, tests pass." This rule is about grammar, not length, so stay concise.

# Scope of changes
- Do only what was asked. Changes needed to complete the task are in scope, but unrelated improvements are not. If you notice something else worth changing, mention it at the end of your reply instead of changing it.
- Keep solutions simple. Do not add abstractions, configuration options, CLI flags, or new files that the task does not require.
- Do not preserve backward compatibility unless I ask for it. When you change an interface, update every place that uses it and delete the old code path. Do not leave adapters, deprecated aliases, or fallback branches.
