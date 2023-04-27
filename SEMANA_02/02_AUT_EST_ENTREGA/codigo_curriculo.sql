BEGIN TRANSACTION;

CREATE TABLE dados_pessoais (
id_pessoal INTEGER NOT NULL,
nome TEXT NOT NULL,
foto TEXT,
cargo TEXT,
PRIMARY KEY(id_pessoal AUTOINCREMENT)
);

CREATE TABLE formacao (
id_formacao INTEGER NOT NULL,
curso TEXT NOT NULL,
duracao TEXT NOT NULL,
instituicao_diploma TEXT NOT NULL,
FOREIGN KEY(id_formacao) REFERENCES dados_pessoais(id_pessoal)
);

CREATE TABLE sobre_mim (
id_sobre INTEGER NOT NULL,
endereco TEXT NOT NULL,
telefone TEXT NOT NULL,
email TEXT NOT NULL,
sinopse TEXT NOT NULL,
FOREIGN KEY(id_sobre) REFERENCES dados_pessoais(id_pessoal)
);

CREATE TABLE experiencias (
id_experiencias INTEGER NOT NULL,
empresa TEXT,
tempo TEXT,
cargo TEXT,
FOREIGN KEY(id_experiencias) REFERENCES dados_pessoais(id_pessoal)
);

CREATE TABLE habilidades (
id_habilidades INTEGER NOT NULL,
habilidade TEXT NOT NULL,
FOREIGN KEY(id_habilidades) REFERENCES dados_pessoais(id_pessoal)
);

CREATE TABLE realizacoes (
id_realizacoes INTEGER NOT NULL,
titulo TEXT NOT NULL,
ano INTEGER NOT NULL,
descricao TEXT NOT NULL,
FOREIGN KEY(id_realizacoes) REFERENCES dados_pessoais(id_pessoal)
);

CREATE TABLE personalidade (
id_personalidade INTEGER NOT NULL,
traco_personalidade TEXT NOT NULL,
FOREIGN KEY(id_personalidade) REFERENCES dados_pessoais(id_pessoal)
);

INSERT INTO dados_pessoais VALUES (1, "Lucas Nogueira Nunes",
"https://www.google.com/url?sa=i&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FMike_Wazowski&psig=AOvVaw1rFIDq2F3YzlMwpmu71C-K&ust=1682698364966000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCMCGg4S6yv4CFQAAAAAdAAAAABAE",
"Diretor de Marketing");

INSERT INTO formacao VALUES (1, "Ciência da Computação", "2023-2026",
"Instituto de Tecnologia e Liderança - Inteli / Bacharelad em Ciência da Computação");

INSERT INTO sobre_mim VALUES (1, "RUA M.M.D.C., 80 / São Paulo - SP", "+55 (21)96482-6274", "lucas.nunes@sou.inteli.edu.br",
"Comecei pequeno e hoje sou grande");

INSERT INTO experiencias VALUES (1, "Banco BTG Pactual", "2020-2023", "Diretor de Marketing e Vendas");

INSERT INTO habilidades VALUES (1, "Marketeiro nato"), (1, "Bom de bola"), (1, "Grande (ex pequeno)");

INSERT INTO realizacoes VALUES (1, "1 bilhão em vendas", 2021, "Vendi um bilhão em produtos BTG Pactual"),
(1, "Diretor em 1 dia", 2020, "Cheguei na empresa e me tornei diretor de marketing e vendas na mesma manhã");

INSERT INTO personalidade VALUES (1, "Confiante"), (1, "Novamente bom de bola"), (1, "Persuasivo");

COMMIT;