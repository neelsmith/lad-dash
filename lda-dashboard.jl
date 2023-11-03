using Pkg
Pkg.activate(pwd())
Pkg.instantiate()

DASHBOARD_VERSION = "0.1"

using Dash
using CitableBase
using CitableText
using CitableCorpus

#app = dash(assets_folder = assetfolder, include_assets_files=true)
app = dash()
apollodorus_url = "https://raw.githubusercontent.com/neelsmith/digitalmyth/main/texts/apollodorus.cex"
c =  fromcex(apollodorus_url, CitableTextCorpus, UrlReader)

app.layout = html_div() do
    dcc_markdown() do 
        """*Dashboard version*: **$(DASHBOARD_VERSION)**. 
        """
    end,
    html_h1("Topic modeling dashboard")
    
end

run_server(app, "0.0.0.0", debug=true)