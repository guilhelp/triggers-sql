-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 06-Abr-2024 às 03:19
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bd_aula`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `cliente_id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `cidade` varchar(255) NOT NULL,
  `estado` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`cliente_id`, `nome`, `email`, `cidade`, `estado`) VALUES
(1, 'João Silva', 'joaosilva@email.com', 'São Paulo', 'SP'),
(2, 'Maria Oliveira', 'mariaoliveira@email.com', 'Rio de Janeiro', 'RJ'),
(3, 'Pedro Souza', 'pedrosouza@email.com', 'Belo Horizonte', 'MG'),
(4, 'Ana Costa', 'anacosta@email.com', 'Salvador', 'BA'),
(5, 'Carlos Santos', 'carloshsantos@email.com', 'Curitiba', 'PR'),
(6, 'Fernanda Lima', 'fernandalim@email.com', 'Brasília', 'DF'),
(7, 'Roberto Dias', 'robertodias@email.com', 'Fortaleza', 'CE'),
(8, 'Eduardo Pereira', 'eduardopereira@email.com', 'Recife', 'PE'),
(9, 'Gabriela Reis', 'gabrielareis@email.com', 'Porto Alegre', 'RS'),
(10, 'Marcelo Campos', 'marcelocampos@email.com', 'Manaus', 'AM');

-- --------------------------------------------------------

--
-- Estrutura da tabela `lixoprodutos`
--

CREATE TABLE `lixoprodutos` (
  `produto_id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `categoria` varchar(255) NOT NULL,
  `preco` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Acionadores `lixoprodutos`
--
DELIMITER $$
CREATE TRIGGER `nao_apagar` AFTER DELETE ON `lixoprodutos` FOR EACH ROW insert produtos values
(
 old.produto_id, 
 old.nome, 
 old.categoria,
 old.preco
)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `produto_id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `categoria` varchar(255) NOT NULL,
  `preco` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`produto_id`, `nome`, `categoria`, `preco`) VALUES
(1, 'Notebook', 'Eletrônicos', '2000.00'),
(2, 'Smartphone', 'Eletrônicos', '1500.00'),
(3, 'Smartwatch', 'Eletrônicos', '500.00'),
(4, 'Camisa', 'Vestuário', '100.00'),
(5, 'Calça', 'Vestuário', '150.00'),
(6, 'Tênis', 'Vestuário', '200.00'),
(7, 'Livro', 'Livros', '50.00'),
(8, 'Caneta', 'Papelaria', '10.00'),
(9, 'Lápis', 'Papelaria', '5.00'),
(10, 'Borracha', 'Papelaria', '2.00');

--
-- Acionadores `produtos`
--
DELIMITER $$
CREATE TRIGGER `deletar_produtos` AFTER DELETE ON `produtos` FOR EACH ROW insert lixoprodutos values
(
 old.produto_id, 
 old.nome, 
 old.categoria,
 old.preco
)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendas`
--

CREATE TABLE `vendas` (
  `venda_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `produto_id` int(11) NOT NULL,
  `data_venda` date NOT NULL,
  `valor_venda` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `vendas`
--

INSERT INTO `vendas` (`venda_id`, `cliente_id`, `produto_id`, `data_venda`, `valor_venda`) VALUES
(1, 1, 1, '2023-01-01', '100.00'),
(2, 2, 2, '2023-02-02', '200.00'),
(3, 3, 3, '2023-03-03', '300.00'),
(4, 4, 1, '2023-04-04', '400.00'),
(5, 5, 2, '2023-05-05', '500.00'),
(6, 6, 3, '2023-06-06', '600.00'),
(7, 7, 1, '2023-07-07', '700.00'),
(8, 8, 2, '2023-08-08', '800.00'),
(9, 9, 3, '2023-09-09', '900.00'),
(10, 10, 1, '2023-10-10', '1000.00');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`cliente_id`);

--
-- Índices para tabela `lixoprodutos`
--
ALTER TABLE `lixoprodutos`
  ADD PRIMARY KEY (`produto_id`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`produto_id`);

--
-- Índices para tabela `vendas`
--
ALTER TABLE `vendas`
  ADD PRIMARY KEY (`venda_id`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `produto_id` (`produto_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `cliente_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `lixoprodutos`
--
ALTER TABLE `lixoprodutos`
  MODIFY `produto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `produto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `vendas`
--
ALTER TABLE `vendas`
  MODIFY `venda_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `vendas`
--
ALTER TABLE `vendas`
  ADD CONSTRAINT `vendas_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`),
  ADD CONSTRAINT `vendas_ibfk_2` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`produto_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
