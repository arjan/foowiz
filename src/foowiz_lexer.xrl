Definitions.

VAR_OPEN = \{\{
VAR_CLOSE = \}\}

Rules.

{VAR_OPEN}        : {token, {var_open, x}}.
{VAR_CLOSE}       : {token, {var_close, x}}.
\s+               : {token, {ws, TokenChars}}.
[^\{\}\s]+            : {token, {literal, TokenChars}}.

Erlang code.
