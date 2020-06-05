-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Tempo de geração: 05-Jun-2020 às 13:26
-- Versão do servidor: 8.0.18
-- versão do PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `agendaconsultas`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `consulta`
--

DROP TABLE IF EXISTS `consulta`;
CREATE TABLE IF NOT EXISTS `consulta` (
  `CodigoConvenio` int(11) NOT NULL,
  `NumeroPaciente` int(11) NOT NULL,
  `CRM` int(11) NOT NULL,
  `Data-Hora` datetime NOT NULL,
  PRIMARY KEY (`CodigoConvenio`,`NumeroPaciente`,`CRM`,`Data-Hora`),
  KEY `CodigoConvenio` (`CodigoConvenio`,`NumeroPaciente`),
  KEY `CRM` (`CRM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `consulta`
--

INSERT INTO `consulta` (`CodigoConvenio`, `NumeroPaciente`, `CRM`, `Data-Hora`) VALUES
(1, 1, 1, '2020-05-26 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `convenio`
--

DROP TABLE IF EXISTS `convenio`;
CREATE TABLE IF NOT EXISTS `convenio` (
  `CodigoConvenio` int(11) NOT NULL,
  `Nome` varchar(30) NOT NULL,
  PRIMARY KEY (`CodigoConvenio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `convenio`
--

INSERT INTO `convenio` (`CodigoConvenio`, `Nome`) VALUES
(1, 'UNIMED'),
(2, 'PREVENTSENIOR');

-- --------------------------------------------------------

--
-- Estrutura da tabela `medico`
--

DROP TABLE IF EXISTS `medico`;
CREATE TABLE IF NOT EXISTS `medico` (
  `CRM` int(11) NOT NULL,
  `Nome` varchar(30) NOT NULL,
  `Especializacao` varchar(30) NOT NULL,
  PRIMARY KEY (`CRM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `medico`
--

INSERT INTO `medico` (`CRM`, `Nome`, `Especializacao`) VALUES
(1, 'Manoel Joaquim', 'Clinico Geral'),
(2, 'Epaminondas Santos', 'Otorrinolaringologista'),
(5, 'Epamindas Baciclides da Silva', 'Infectologista');

-- --------------------------------------------------------

--
-- Estrutura da tabela `paciente`
--

DROP TABLE IF EXISTS `paciente`;
CREATE TABLE IF NOT EXISTS `paciente` (
  `CodigoConvenio` int(11) NOT NULL,
  `NumeroPaciente` int(11) NOT NULL,
  `Nome` varchar(30) NOT NULL,
  PRIMARY KEY (`CodigoConvenio`,`NumeroPaciente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `paciente`
--

INSERT INTO `paciente` (`CodigoConvenio`, `NumeroPaciente`, `Nome`) VALUES
(1, 1, 'Trophozilda Silva'),
(1, 2, 'Baciclides Pereira'),
(1, 300, 'Trophosilda Matoso');

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `consulta`
--
ALTER TABLE `consulta`
  ADD CONSTRAINT `consulta_ibfk_1` FOREIGN KEY (`CRM`) REFERENCES `medico` (`CRM`),
  ADD CONSTRAINT `consulta_ibfk_2` FOREIGN KEY (`CodigoConvenio`,`NumeroPaciente`) REFERENCES `paciente` (`CodigoConvenio`, `NumeroPaciente`);

--
-- Limitadores para a tabela `paciente`
--
ALTER TABLE `paciente`
  ADD CONSTRAINT `paciente_ibfk_1` FOREIGN KEY (`CodigoConvenio`) REFERENCES `convenio` (`CodigoConvenio`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
