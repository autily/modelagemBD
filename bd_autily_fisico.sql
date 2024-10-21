-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 30-Set-2024 às 16:10
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bd_autily`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `crianca`
--

CREATE TABLE `crianca` (
  `id_crianca` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `idade` int(11) DEFAULT NULL,
  `nivel_de_suporte` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cri_resp`
--

CREATE TABLE `cri_resp` (
  `fk_responsavel_id_resp` int(11) NOT NULL,
  `fk_crianca_id_crianca` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `jogam`
--

CREATE TABLE `jogam` (
  `fk_crianca_id_crianca` int(11) NOT NULL,
  `fk_jogos_id_jogo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `jogos`
--

CREATE TABLE `jogos` (
  `id_jogo` int(11) NOT NULL,
  `nome_jogo` varchar(100) DEFAULT NULL,
  `pontuacao` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `responsavel`
--

CREATE TABLE `responsavel` (
  `id_resp` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `senha` varchar(100) DEFAULT NULL,
  `fk_tipo_cod` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `rotina`
--

CREATE TABLE `rotina` (
  `horario_inicio` time NOT NULL,
  `horario_final` time DEFAULT NULL,
  `tarefa` varchar(255) DEFAULT NULL,
  `fk_responsavel_id_resp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `rotinacrianca`
--

CREATE TABLE `rotinacrianca` (
  `fk_crianca_id_crianca` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo`
--

CREATE TABLE `tipo` (
  `cod` int(11) NOT NULL,
  `descr` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `crianca`
--
ALTER TABLE `crianca`
  ADD PRIMARY KEY (`id_crianca`);

--
-- Índices para tabela `cri_resp`
--
ALTER TABLE `cri_resp`
  ADD PRIMARY KEY (`fk_responsavel_id_resp`,`fk_crianca_id_crianca`),
  ADD KEY `FK_cri_resp_2` (`fk_crianca_id_crianca`);

--
-- Índices para tabela `jogam`
--
ALTER TABLE `jogam`
  ADD PRIMARY KEY (`fk_crianca_id_crianca`,`fk_jogos_id_jogo`),
  ADD KEY `FK_jogam_2` (`fk_jogos_id_jogo`);

--
-- Índices para tabela `jogos`
--
ALTER TABLE `jogos`
  ADD PRIMARY KEY (`id_jogo`);

--
-- Índices para tabela `responsavel`
--
ALTER TABLE `responsavel`
  ADD PRIMARY KEY (`id_resp`),
  ADD KEY `FK_responsavel_2` (`fk_tipo_cod`);

--
-- Índices para tabela `rotina`
--
ALTER TABLE `rotina`
  ADD PRIMARY KEY (`horario_inicio`,`fk_responsavel_id_resp`),
  ADD KEY `FK_rotina_1` (`fk_responsavel_id_resp`);

--
-- Índices para tabela `rotinacrianca`
--
ALTER TABLE `rotinacrianca`
  ADD PRIMARY KEY (`fk_crianca_id_crianca`);

--
-- Índices para tabela `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`cod`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `cri_resp`
--
ALTER TABLE `cri_resp`
  ADD CONSTRAINT `FK_cri_resp_1` FOREIGN KEY (`fk_responsavel_id_resp`) REFERENCES `responsavel` (`id_resp`),
  ADD CONSTRAINT `FK_cri_resp_2` FOREIGN KEY (`fk_crianca_id_crianca`) REFERENCES `crianca` (`id_crianca`);

--
-- Limitadores para a tabela `jogam`
--
ALTER TABLE `jogam`
  ADD CONSTRAINT `FK_jogam_1` FOREIGN KEY (`fk_crianca_id_crianca`) REFERENCES `crianca` (`id_crianca`),
  ADD CONSTRAINT `FK_jogam_2` FOREIGN KEY (`fk_jogos_id_jogo`) REFERENCES `jogos` (`id_jogo`);

--
-- Limitadores para a tabela `responsavel`
--
ALTER TABLE `responsavel`
  ADD CONSTRAINT `FK_responsavel_2` FOREIGN KEY (`fk_tipo_cod`) REFERENCES `tipo` (`cod`);

--
-- Limitadores para a tabela `rotina`
--
ALTER TABLE `rotina`
  ADD CONSTRAINT `FK_rotina_1` FOREIGN KEY (`fk_responsavel_id_resp`) REFERENCES `responsavel` (`id_resp`);

--
-- Limitadores para a tabela `rotinacrianca`
--
ALTER TABLE `rotinacrianca`
  ADD CONSTRAINT `FK_rotinacrianca_1` FOREIGN KEY (`fk_crianca_id_crianca`) REFERENCES `crianca` (`id_crianca`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
