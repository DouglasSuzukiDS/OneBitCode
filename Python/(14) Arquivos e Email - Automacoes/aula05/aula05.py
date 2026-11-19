# Aula05 - Lendo arquivos XML
from pathlib import Path
from lxml import etree

xml_exemplo = """<?xml version="1.0" encoding="UTF-8"?>
<pedido id="1042">
    <cliente status="ativo">Carlos Eduardo</cliente>
    <itens>
        <item codigo="A01" preco="50.00">Teclado Mecânico</item>
        <item codigo="A02" preco="120.00">Mouse Sem Fio</item>
    </itens>
</pedido>
"""

raiz = etree.fromstring(xml_exemplo.encode('utf-8'))
print(f'Id do Pedido: {raiz.get("id")}')

cliente = raiz.find('cliente')

if cliente is None:
   exit()

print(f'Cliente: {cliente.text} | Status: {cliente.get("status")}')

for item in raiz.findall('.//item'): # Busca todos os elementos <item> em qualquer nível
   print(f'Produto: {item.text}: R$ {item.get("preco")}')

itens_caros = raiz.xpath('//item[@preco > 60]/text()') # Busca todos os elementos com preço maior que 60
print(f'Itens com preço maior que 60: {itens_caros}')


xml_nfe = '''<?xml version="1.0" encoding="UTF-8"?>
<nfeProc xmlns="http://www.portalfiscal.inf.br/nfe" versao="4.00">
  <NFe>
    <infNFe Id="NFe35260100000000000000000550010000000011000000010">
      <emit>
        <xNome>Empresa Distribuidora LTDA</xNome>
      </emit>
      <dest>
        <xNome>Supermercado Modelo S/A</xNome>
      </dest>
      <total>
        <ICMSTot>
          <vNF>2450.80</vNF>
        </ICMSTot>
      </total>
    </infNFe>
  </NFe>
</nfeProc>
'''

raiz_nfe = etree.fromstring(xml_nfe.encode('utf-8'))
ns = {'nfe': 'http://www.portalfiscal.inf.br/nfe'} # Define o namespace para a busca
item = raiz_nfe.find('.//nfe:NFe/nfe:infNFe', namespaces=ns) # Busca o elemento <NFe> usando o namespace

if item is not None:
   exit()
   
print(item.get('Id')) # Imprime o valor do atributo Id do elemento <infNFe>