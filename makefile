define log
    @echo "###############################"
    @echo "[$(shell date --rfc-3339=seconds)]: $(1) $(2) $(3) $(4) $(5) $(6) $(7)"
    @echo "###############################"
endef

clean:
	$(call log,"Clean")
	@rm -rf build dist emr_helper.egg-info

build: clean
	$(call log,"Build")
	@python setup.py sdist bdist_wheel

upload:
	$(call log,"Upload")
	@python -m twine upload dist/*

all: build upload
