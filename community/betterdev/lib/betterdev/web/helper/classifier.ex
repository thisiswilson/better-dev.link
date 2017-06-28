defmodule Betterdev.Helper.Classifier do
  @taxonomy [
    {:ruby, ["ruby", ".rb", "rails", "active record", "tdd", "def", "module", "class", "gem"]},
    {:php, ["php", ".php", "laravel", "symfony", "composer", "packagist"]},
    {:go, ["go lang", ".go", "golang", "type", "struct"]},
    {:elixir, ["elixir", ".ex", "iex", "mix", "hex"]},
    {:erlang, ["erlang", ".erl", "rebar", "erl", "IO", "mix"]},
    {:nodejs, ["nodejs", "javascript", ".js", "v8", "es6", "jsx"]},
    {:linux, ["linux", "bash", "vim", "terminal", "server", "system", "configuration", "gdb", "ssh"]},
    {:algorithm, ["algorithm", "code", "interview", "programming", "tree", "stack", "queue", "question", "job", "crawl", "scrape", "structure"]},
    {:design, ["design", "css", "typography", "typeface"]},
    {:css, ["css", "html"]},
  ]

  def extract(content) do
    Enum.map(@taxonomy, fn ({term, words}) ->
      score = Enum.reduce(words, 0, fn (w, acc) ->
        case String.contains?(content, w) do
          true -> acc + 1
          false -> acc
        end
      end)
      {term, score}
    end) |> Enum.filter_map(fn ({term, score}) -> score >=3 end, fn({term, score}) -> term end)
  end
end
