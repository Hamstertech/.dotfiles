local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
	-- foreach
	s("foreach", {
		t("foreach ("),
		i(1, "$items"),
		t(" as "),
		i(2, "$item"),
		t({ ") {", "\t" }),
		i(0),
		t({ "", "}" }),
	}),

	-- while
	s("while", {
		t("while ("),
		i(1, "$condition"),
		t({ ") {", "\t" }),
		i(0),
		t({ "", "}" }),
	}),

	-- if
	s("if", {
		t("if ("),
		i(1, "$condition"),
		t({ ") {", "\t" }),
		i(0),
		t({ "", "}" }),
	}),

	-- elseif
	s("elseif", {
		t("elseif ("),
		i(1, "$condition"),
		t({ ") {", "\t" }),
		i(0),
		t({ "", "}" }),
	}),

	-- else
	s("else", {
		t({ "else {", "\t" }),
		i(0),
		t({ "", "}" }),
	}),

	-- switch
	s("switch", {
		t("switch ("),
		i(1, "$variable"),
		t({ ") {", "\tcase " }),
		i(2, "$case"),
		t({ ":", "\t\t" }),
		i(3),
		t({ "", "\t\tbreak;", "\tdefault:", "\t\t" }),
		i(0),
		t({ "", "\t\tbreak;", "}" }),
	}),

	-- match (PHP 8+)
	s("match", {
		t("$result = match ("),
		i(1, "$variable"),
		t({ ") {", "\t" }),
		i(2, "value"),
		t(" => "),
		i(3, "result"),
		t({ ",", "\tdefault => " }),
		i(0, "fallback"),
		t({ ",", "};" }),
	}),

	-- function
	s("fn", {
		t("function "),
		i(1, "functionName"),
		t("("),
		i(2),
		t({ ") {", "\t" }),
		i(0),
		t({ "", "}" }),
	}),

	-- class
	s("class", {
		t("class "),
		i(1, "ClassName"),
		t({ " {", "\tpublic function __construct(" }),
		i(2),
		t({ ") {", "\t\t" }),
		i(0),
		t({ "", "\t}", "}" }),
	}),

	-- for
	s("for", {
		t("for ("),
		i(1, "$i = 0"),
		t("; "),
		i(2, "$i < count($items)"),
		t("; "),
		i(3, "$i++"),
		t({ ") {", "\t" }),
		i(0),
		t({ "", "}" }),
	}),

	-- try-catch
	s("try", {
		t({ "try {", "\t" }),
		i(0),
		t({ "", "} catch (" }),
		i(1, "\\Exception $e"),
		t({ ") {", "\t" }),
		i(2),
		t({ "", "}" }),
	}),

	-- namespace/use
	s("ns", {
		t("namespace "),
		i(1, "App"),
		t(";"),
	}),
	s("use", {
		t("use "),
		i(1, "Some\\Namespace\\Class"),
		t(";"),
	}),

	-- return
	s("ret", {
		t("return "),
		i(0),
		t(";"),
	}),

	-- echo/print_r/var_dump
	s("echo", {
		t("echo "),
		i(0),
		t(";"),
	}),
	s("pr", {
		t("print_r("),
		i(0),
		t(");"),
	}),
	s("vd", {
		t("var_dump("),
		i(0),
		t(");"),
	}),

	-- docblock
	s("doc", {
		t({ "/**", " * " }),
		i(1, "Description"),
		t({ "", " *", " * @param " }),
		i(2, "type $var"),
		t({ "", " * @return " }),
		i(3, "type"),
		t({ "", " */" }),
	}),

	-- public/private/protected method
	s("pubf", {
		t({ "public function " }),
		i(1, "methodName"),
		t("("),
		i(2),
		t({ ") {", "\t" }),
		i(0),
		t({ "", "}" }),
	}),
	s("prif", {
		t({ "private function " }),
		i(1, "methodName"),
		t("("),
		i(2),
		t({ ") {", "\t" }),
		i(0),
		t({ "", "}" }),
	}),
	s("prof", {
		t({ "protected function " }),
		i(1, "methodName"),
		t("("),
		i(2),
		t({ ") {", "\t" }),
		i(0),
		t({ "", "}" }),
	}),

	-- constructor property promotion
	s("ctor", {
		t({ "public function __construct(", "\t" }),
		i(1, "private string $name"),
		t({ "", ") {", "\t" }),
		i(0),
		t({ "", "}" }),
	}),

	-- arrow function
	s("fnc", {
		t("fn("),
		i(1),
		t(") => "),
		i(0),
	}),
}
