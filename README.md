# mm2json
Synopsis: Converts .mm files to .json format using Freemind (only tested on Freemind 1.0.1)

Anyone wondered how to extract usable data structures from Freemind ? Freemind has developed a clever way to shape Freemind data in almost any format.
The **XSLT export** function will take any XSLT (*Extensible Stylesheet Language Transformations*) file as input, and shape your export file accordingly.
In this repo, I am publishing such an XSLT file that conveniently will allow you to export your mind maps to a multi-purpose .json file.

e.g. I feed the exported .json files into a Google Apps Script, to generate mind maps on-the-fly within Google slides.  My master mindmap still remains on Freemind, which I keep for editing, after which I can directly update my Google slides.  I'm doing it this way because Freemind natively does not produce presentable, let alone visually attractive mind maps.

# How to use ?

- Download mm2json.xsl from this project
- Copy this file to a default directory of Freemind (e.g. C:\Program Files\FreeMind\accessories)
- Run Freemind 1.0.1 or lower
  - File ==> Open any Freemind document (*.mm)
  - File ==> Export ==> Using XSLT...
    -> Choose XSL File: (default directory)/mm2json.xsl
    -> Chose ExportFile: (destination directory)/filename.json

