Terminals ws var_open var_close literal.

Nonterminals grammar symbol.

Rootsymbol grammar.

grammar ->
    symbol : ['$1'].

grammar ->
    symbol grammar : ['$1' | '$2'].

symbol ->
    var_open literal var_close : extract_var('$2').
symbol ->
    ws : extract_token('$1').
symbol ->
    literal : extract_token('$1').

Erlang code.

extract_token({_Token, Value}) -> erlang:list_to_binary(Value).

extract_var({literal, Value}) -> {var, erlang:list_to_atom(Value)}.
