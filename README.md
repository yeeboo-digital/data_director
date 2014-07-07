### Import

```
DATA_TYPE=canada,english rake director:import file.csv
DATA_TYPE=greece,english rake director:import greecedump.csv
```


### Normalize

Define normalizers in lib/normalizers/

They might look something like:

* Normalizers::Canada
* Normalizers::Greece
* Normalizers::English


```
rake director:normalize
```


### Format

Define formatters in lib/formatters/

```
rake director:format
```