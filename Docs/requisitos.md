Levantamento e Especificação de Requisitos

Objetivo

Desenvolver um módulo de gestão de escalas e plantões no sistema Escala360 para hospitais e clínicas, substituindo o uso de planilhas e e-mails. O sistema deve permitir:

- Alocação automatizada de profissionais;

- Gerenciamento de substituições;

- Controle de conflitos de horário;

- Comunicação automatizada por e-mail e WhatsApp.

Requisitos Funcionais (RF)

- RF01: Permitir a alocação automática de profissionais com base em disponibilidade e carga horária.

- RF02: Permitir solicitação de substituições.

- RF03: Exibir escalas com visão semanal e mensal.

- RF04: Enviar notificações automáticas por e-mail e WhatsApp.

- RF05: Sugerir até 3 substitutos disponíveis com menor carga horária acumulada.

- RF06: Registrar todas as alterações em tabela de auditoria.

- RF07: Permitir que supervisores aprovem substituições.

Requisitos Não Funcionais (RNF)

- RNF01: Disponibilidade mínima de 99,5%.

- RNF02: Disparo de notificações em até 2 minutos após a alteração.

- RNF03: Comunicação via API protegida com autenticação JWT.

Regras de Negócio

1. Carga horária semanal máxima (ex: 40h), excedida apenas com aprovação.

2. Um plantão não pode ter dois profissionais com a mesma função e horário.

3. Substituições devem ser feitas com no mínimo 12h de antecedência (exceto com aprovação).

4. Sistema deve sugerir 3 substitutos com menor carga horária.

5. Toda alteração deve ser registrada em auditoria.

6. Escalas devem ser exibidas com visão semanal e mensal.