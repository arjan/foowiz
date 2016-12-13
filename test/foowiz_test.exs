defmodule FoowizTest do
  use ExUnit.Case
  doctest Foowiz

  test "lexer" do
    assert {:ok, [{:ws, '   '}], 1} == :foowiz_lexer.string('   ')
  end

  test "parser" do
    assert {:ok, ["   "]} == :foowiz_parser.parse([{:ws, '   '}])
    assert {:ok, [{:var, :a}]} == :foowiz_parser.parse([{:var_open, :x}, {:literal, 'a'}, {:var_close, :x}])
  end

  test "parser 2" do
    assert {:ok, [{:var, :a}]} == Foowiz.parse("{{a}}")
    assert {:ok, [{:var, :a}, " ", {:var, :b}]} == Foowiz.parse("{{a}} {{b}}")
  end

  test "eval" do
    assert "foo 123 bar" == Foowiz.eval("foo {{a}} bar", %{a: 123})
    assert "aa aa aa" == Foowiz.eval("{{a}} {{a}} {{a}}", %{a: "aa"})
    assert "aap aap" == Foowiz.eval("{{a}} {{a}}", %{a: "aap"})
    assert "Hello, Arjan!" == Foowiz.eval("Hello, {{name}}!", %{name: "Arjan"})
  end

end
