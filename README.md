# Foowiz

An Elixir toy template engine to test my lexing and parsing skills.

## Usage

The main entry point is `Foowiz.eval/2`:

    Foowiz.eval(template, variables)

## Template syntax

Variables are expressed like this: `{{name}}`. All other code is taken
literaly:

    assert "foo 123 bar" == Foowiz.eval("foo {{a}} bar", %{a: 123})
    assert "aap aap" == Foowiz.eval("{{a}} {{a}}", %{a: "aap"})
    assert "Hello, Arjan!" == Foowiz.eval("Hello, {{name}}!", %{name: "Arjan"})
