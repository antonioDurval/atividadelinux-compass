# Documentação instalação do Linux(EC2)

## Criando a VPC
- Selecione o serviço de VPC
- Clique em Suas VPC, depois criar VPC

### Criar VPC - Configurações da VPC
- <strong>Tag de nome(Opcional):</strong> Minha-VPC
- <strong>CIDR IPv4:</strong> 172.29.0.0/16
- <strong>Bloco CIDR IPv6:</strong> Nenhum bloco CIDR IPv6
- <strong>Locação:</strong> Padrão
- Clique em <strong>Criar VPC</strong>
- Após a criação da sua VPC, clique em: Sub-Redes, Criar sub-rede.

### Criando Sub-Redes
- <strong>ID da VPC:</strong> Minha-VPC
- <strong>Nome da sub-rede:</strong> sub-publica001
- <strong>Zona de disponibilidade(AZ):</strong> us-east-1a (Selecione a de sua preferencia)
- <strong>Bloco CIDR IPv4:</strong> 172.29.2.0/24
- Crie outra(s) Sub-Redes seguindo os passos acima.
- Após a criação das Sub-Redes, crie uma Tabela de Rotas: Clique em Tabelas de Rotas, criar tabela de rotas.

### Criando Tabelas de Rotas
- <strong>Nome(opcional)</strong>: Tabela-Exemplo
- <strong>VPC:</strong> Selecione a VPC desejada, nesse caso a VPC criada nos passos acima <strong>Minha-VPC</strong>
- Clique em Criar tabela de rotas.
- Agora devemos associar as nossas sub-redes a Tabela de rotas criada(Tabela-Exemplo), mas antes devemos criar uma Internet Gateway

### Criando Internet Gateway
- Clique em Gateways da Internet
- <strong>Tag de nome: </strong>igw-exemplo
- Clique em criar gateway da internet
- Após criado devemos dar um Attach para nossa VPC, Clique em <i>Attach to VPC</i> e Selecione a VPC(<strong>Minha-VPC</strong>)
- Com isso configurado agora podemos tornar as nossas Sub-Redes criadas em Sub-Redes públicas
- Vá Até Tabelas de Rotas, selecione a Tabela desejada então edite suas Rotas -> <strong>Destino:</strong> 0.0.0.0/0 | <strong>Alvo:</strong> Gateway Criado(<strong>igw-exemplo</strong>)
- Continuamos na Tabela de Rotas e agora iremos associar as Sub-Redes criadas a essa Tabela de Rotas(<strong>Tabela-Exemplo</strong>)
- Clique em Editar associação de sub-rede e selecione as sub-redes desejadas.

## Criando o Security Group
- Selecione o serviço de EC2.
- Clique em Security Groups, criar grupo de segurança.

###  Criar Grupo de Segurança - Informações
- <strong>Nome do grupo de segurança: </strong>SG-Exemplo
- Descrição: Descrição desejada
- <strong>VPC: </strong>Selecione a VPC desejada(<strong>Minha-VPC</strong>)
- Crie as seguintes regras de Entrada:
  <table>
    <tr>
      <th>Tipo</th>
      <th>Protocolo</th>
      <th>Intervalo de portas</th>
      <th>Origem</th> 
    </tr>
    <tr>
      <td>TCP pernsonalizado</td>
      <td>TCP</td>
      <td>111</td>
      <td>0.0.0.0/0</td>
    </tr>
    <tr>
      <td>UDP personalizado</td>
      <td>UDP</td>
      <td>111</td>
      <td>0.0.0.0/0</td>
    </tr>
    <tr>
      <td>HTTPS</td>
      <td>TCP</td>
      <td>443</td>
      <td>0.0.0.0/0</td>
    </tr>
    <tr>
      <td>HTTP</td>
      <td>TCP</td>
      <td>80</td>
      <td>0.0.0.0/0</td>
    </tr>
    <tr>
      <td>NFS</td>
      <td>TCP</td>
      <td>2049</td>
      <td>0.0.0.0/0</td>
    </tr>
    <tr>
      <td>UDP personalizado</td>
      <td>UDP</td>
      <td>2049</td>
      <td>0.0.0.0/0</td>
    </tr>
    <tr>
      <td>SSH</td>
      <td>TCP</td>
      <td>22</td>
      <td>Meu IP</td>
    </tr>
  </table>
  
- Clique em Criar grupo de segurança.


## Criando a Instância EC2
- Clique em instâncias, executar instância
### Nomes e Tags:
- Crie 3 Tags
<table>
    <tr>
      <th>Chave</th>
      <th>Valor</th>
    </tr>
    <tr>
      <td>Project</td>
      <td>PB</td>
    </tr>
    <tr>
      <td>CostCenter</td>
      <td>PBCompass</td>
    </tr>
    <tr>
      <td>Name</td>
      <td>Seu nome</td>
    </tr>
</table>

### Selecione a imagem de aplicação:
- Amazon Linux 2
### Selecione o tipo da instância:
- t3.small
### Selecionar/Criar o Key pair(login):
- Caso já tenha uma key pair não é necessario a criação de outra.
- Caso não possua, clique em Create new key pair, dê um nome a ela e faça o download do arquivo .pem ou .ppk(Putty)
### Edite as configurações de Rede:
- <strong>VPC: </strong>Selecione a VPC criada anteriormente(<strong>Minha-VPC</strong>)
- <strong>Sub-rede:</strong> Selecione a sub-rede criada
- Selecione um grupo de segurança existente, escolha o que foi criado anteriormente(<strong>SG-Exemplo</strong>)
### Configurar Armazenamento:
- Crie um disco GP2 de 16GiB
- Verifique todos os dados preenchidos e Clique em Executar Instância
