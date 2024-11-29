# Coinbase Advanced API Ruby SDK (Unofficial)

Ruby port of https://github.com/coinbase/coinbase-advanced-py/

## Caveats:

1. Starting with REST port
2. WebSocket not supported yet and won't be until REST is complete which could take a while
3. To ship as fast as possible, I'm trying my best to keep the structure as similar as possible (directories, file names, classes, method signatures, order, etc) but the python SDK is _too_ verbose in some places. I'll keep a list of any substantial deviations. The more I dig in I'm sure the more annoyed I will get and will refactor the entire thing, but one step at a time.

### Substantial differences

* **jwt_generator.rb is stubbed out for now. JWT generation logic cotained in coinbase/rest/rest_base.rb.** The .py implementation seems to be adhering too strictly to DRY, 80% of the file is comments, and it makes no sense (IMHO) that it's separated from the RESTBase / APIBase classes which contain required instance variables to generate the JWT.
