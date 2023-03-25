USE [BancoUH]
GO
/****** Object:  Table [dbo].[cajero]    Script Date: 24/03/2023 20:40:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cajero](
	[id_cajero] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cajero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 24/03/2023 20:40:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[depositos]    Script Date: 24/03/2023 20:40:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[depositos](
	[id_cajeroDeposito] [int] NULL,
	[id_clienteDeposito] [int] NULL,
	[monto] [money] NULL,
	[fecha] [date] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[depositos] ADD  DEFAULT ((0)) FOR [monto]
GO
ALTER TABLE [dbo].[depositos]  WITH CHECK ADD  CONSTRAINT [FK_id_cajeroDeposito] FOREIGN KEY([id_cajeroDeposito])
REFERENCES [dbo].[cajero] ([id_cajero])
GO
ALTER TABLE [dbo].[depositos] CHECK CONSTRAINT [FK_id_cajeroDeposito]
GO
ALTER TABLE [dbo].[depositos]  WITH CHECK ADD  CONSTRAINT [FK_id_clienteDeposito] FOREIGN KEY([id_clienteDeposito])
REFERENCES [dbo].[cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[depositos] CHECK CONSTRAINT [FK_id_clienteDeposito]
GO
/****** Object:  StoredProcedure [dbo].[SP_Borrarclientes]    Script Date: 24/03/2023 20:40:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Borrarclientes]

  @ID INT

	as
		begin
			DELETE  cliente WHERE id_cliente = @ID
		end
GO
/****** Object:  StoredProcedure [dbo].[SP_IngresarClientes]    Script Date: 24/03/2023 20:40:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_IngresarClientes]

  @nombre varchar(50)

	as
		begin
			insert into  cliente(NOMBRE) values (@nombre)
		end
GO
/****** Object:  StoredProcedure [dbo].[SP_ListadoClientes]    Script Date: 24/03/2023 20:40:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ListadoClientes]
   as
		begin
			select * from cliente
		end
GO
