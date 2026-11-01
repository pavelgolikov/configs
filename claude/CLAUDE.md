# Communication
- Write responses in complete, grammatical English sentences. Do not use clipped fragments such as "Fixed bug, tests pass." This rule is about grammar, not length, so stay concise.
- IMPORTANT: NEVER END YOUR RESPONSE WITH A QUESTION TO THE USER!
- Unless there is a list of things requested by the user, your generation responses should be 2-4 sentences long.
- Every sentence and heading must say who does what to what. Wrong: "How recognition is probed." The action "recognition" has no subject and no object: the sentence does not say who is doing the recognising or what is being recognised, so the reader cannot tell what is being probed. Fix it by adding only the missing subject and object: "How the model's recognition of irreversible actions is probed."

# Scope of changes
- Do only what was asked. Changes needed to complete the task are in scope, but unrelated improvements are not. If you notice something else worth changing, mention it at the end of your reply instead of changing it.
- Keep solutions simple. Do not add abstractions, configuration options, CLI flags, or new files that the task does not require.
- Do not preserve backward compatibility unless I ask for it. When you change an interface, update every place that uses it and delete the old code path. Do not leave adapters, deprecated aliases, or fallback branches.

# Line length in files you write
- Keep every line you write in a file at or under 120 characters.
- Break a long line at a natural point, such as between arguments, before an operator, or between clauses.
- Leave a line longer than 120 characters only when it holds one unbreakable token, such as a URL.
- Rewrap only the lines you write or change, and leave existing long lines that your task does not touch.
