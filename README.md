# mm2json
Converts .mm files (only tested on Freemind 1.0.1) to .json files

# How to use ?

- Download mm2json.xsl from this project
- Copy this file to a default directory of Freemind (e.g. C:\Program Files\FreeMind\accessories)
- Run Freemind 1.0.1 or lower
  - File ==> Open any Freemind document (*.mm)
  - File ==> Export ==> Using XSLT...
    -> Choose XSL File: (default directory)/mm2json.xsl
    -> Chose ExportFile: (destination directory)/filename.json

Note:  I am loading the .json file into an Google Apps Script to generate mind maps on Google slides. 
