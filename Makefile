PROJECT := decimal

ERL := erl
EPATH = -pa ebin -pz deps/*/ebin -pa ../freya

all: clean compile

clean:
	@rm -rf ebin/*.beam

compile:
	@test -d ebin || mkdir ebin
	@erl -make

console:
	$(ERL) -sname $(PROJECT) $(EPATH)

test: clean compile
	@erl -noshell -pa ebin -eval 'case eunit:test("ebin") of ok -> halt(0); _ -> halt(1) end'
