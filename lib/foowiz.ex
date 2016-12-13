defmodule Foowiz do

  def parse(input) do
    {:ok, tokens, _} = :foowiz_lexer.string(String.to_charlist(input))
    :foowiz_parser.parse(tokens)
  end

  def create_ast(input) when is_binary(input) do
    {:ok, parsetree} = parse(input)
    create_ast(parsetree)
  end
  def create_ast(input) do
    create_ast(input, []) |> Enum.reverse
  end

  def create_ast([], output), do: output
  def create_ast([{:var, var} | rest], output) do
    create_ast(rest, [quote do to_string(unquote(Macro.var(:input, nil))[unquote(var)]) end | output])
  end
  def create_ast([literal | rest], output) do
    create_ast(rest, [literal | output])
  end

  def eval(template, variables) do
    ast = create_ast(template)
    {result, _} = Code.eval_quoted(ast, [input: variables], [])
    result |> IO.chardata_to_string()
  end

end
