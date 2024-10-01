--
--  Copyright (C) 2024, Vadim Godunko <vgodunko@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

--  pragma Restrictions (No_Elaboration_Code);

pragma Ada_2022;

private package A0B.STM32F401.GPIO.Configuration
  with Preelaborate
is

   AF : constant array (Function_Line) of Line_Descriptor_Array :=
     [I2C1_SCL  => [(True, B, 6, 4), (True, B, 8, 4), others => <>],
      I2C1_SDA  => [(True, B, 7, 4), (True, B, 9, 4), others => <>],
      I2C1_SMBA => [(True, B, 5, 4), others => <>],
      I2C2_SCL  => [(True, B, 10, 4), others => <>],
      I2C2_SDA  => [(True, B, 3, 9), others => <>],
      I2C2_SMBA  => [(True, B, 12, 4), others => <>],
      I2C3_SCL  => [(True, A, 8, 4), others => <>],
      I2C3_SDA  => [(True, B, 4, 9), (True, C, 9, 4), others => <>],
      I2C3_SMBA => [(True, A, 9, 4), others => <>],

      SPI1_MISO => [(True, A, 6, 5), (True, B, 4, 5), others => <>],
      SPI1_MOSI => [(True, A, 7, 5), (True, B, 5, 5), others => <>],
      SPI1_NSS  => [(True, A, 4, 5), (True, A, 15, 5), others => <>],
      SPI1_SCK  => [(True, A, 5, 5), (True, B, 3, 5), others => <>],
      SPI2_MISO => [(True, B, 14, 5), (True, C, 2, 5), others => <>],
      SPI2_MOSI => [(True, B, 15, 5), (True, C, 3, 5), others => <>],
      SPI2_NSS  => [(True, B, 9, 5), (True, B, 12, 5), others => <>],
      SPI2_SCK  => [(True, B, 10, 5), (True, B, 13, 5), (True, D, 3, 5)],
      SPI3_MISO => [(True, B, 4, 6), (True, C, 11, 6), others => <>],
      SPI3_MOSI => [(True, B, 5, 6), (True, C, 12, 6), (True, D, 6, 5)],
      SPI3_NSS  => [(True, A, 4, 6), (True, A, 15, 6), others => <>],
      SPI3_SCK  => [(True, B, 3, 6), (True, C, 10, 6), others => <>],
      SPI4_MISO => [(True, E, 5, 5), (True, E, 13, 5), others => <>],
      SPI4_MOSI => [(True, E, 6, 5), (True, E, 14, 5), others => <>],
      SPI4_NSS  => [(True, E, 4, 5), (True, E, 11, 5), others => <>],
      SPI4_SCK  => [(True, E, 2, 5), (True, E, 12, 5), others => <>],

      USART1_CTS => [(True, A, 11, 7), others => <>],
      USART1_RTS => [(True, A, 12, 7), others => <>],
      USART1_TX  => [(True, A, 9, 7), (True, B, 6, 7), others => <>],
      USART1_RX  => [(True, A, 10, 7), (True, B, 7, 7), others => <>],
      USART1_CK  => [(True, A, 8, 7), others => <>],
      USART2_CTS => [(True, A, 0, 7), (True, D, 3, 7), others => <>],
      USART2_RTS => [(True, A, 1, 7), (True, D, 4, 7), others => <>],
      USART2_TX  => [(True, A, 2, 7), (True, D, 5, 7), others => <>],
      USART2_RX  => [(True, A, 3, 7), (True, D, 6, 7), others => <>],
      USART2_CK  => [(True, A, 4, 7), (True, D, 7, 7), others => <>],
      USART6_TX  => [(True, A, 11, 8), (True, C, 6, 8), others => <>],
      USART6_RX  => [(True, A, 12, 8), (True, C, 7, 8), others => <>],
      USART6_CK  => [(True, C, 8, 8), others => <>]];

end A0B.STM32F401.GPIO.Configuration;
