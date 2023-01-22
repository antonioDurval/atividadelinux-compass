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
