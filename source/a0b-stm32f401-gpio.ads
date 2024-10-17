--
--  Copyright (C) 2024, Vadim Godunko <vgodunko@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

--  pragma Restrictions (No_Elaboration_Code);

with A0B.Callbacks;
with A0B.EXTI;
with A0B.GPIO;
with A0B.STM32F401.SVD.GPIO;
private with A0B.Types;

package A0B.STM32F401.GPIO
  with Preelaborate
is

   type GPIO_Controller;

   type Pull_Mode is (No, Pull_Up, Pull_Down);

   type Output_Mode is (Push_Pull, Open_Drain);

   type Output_Speed is (Low, Medium, High, Very_High);

   type EXTI_Mode is (Both_Edge, Rising_Edge, Falling_Edge);

   type GPIO_Line
     (Controller : not null access GPIO_Controller;
      Identifier : GPIO_Line_Identifier) is
        limited new A0B.GPIO.Input_Line
          and A0B.GPIO.Output_Line
          and A0B.EXTI.External_Interrupt_Line with null record;

   procedure Configure_Input
     (Self : aliased in out GPIO_Line'Class;
      Pull : Pull_Mode := No);

   procedure Configure_Output
     (Self  : aliased in out GPIO_Line'Class;
      Mode  : Output_Mode  := Push_Pull;
      Speed : Output_Speed := Low;
      Pull  : Pull_Mode    := No);

   procedure Configure_Alternative_Function
     (Self  : aliased in out GPIO_Line'Class;
      Line  : A0B.STM32F401.Function_Line_Descriptor;
      Mode  : Output_Mode  := Push_Pull;
      Speed : Output_Speed := Low;
      Pull  : Pull_Mode    := No);

   procedure Configure_EXTI
     (Self : aliased in out GPIO_Line'Class;
      Mode : EXTI_Mode;
      Pull : Pull_Mode := No);

   overriding procedure Enable_Interrupt (Self : in out GPIO_Line);

   overriding procedure Disable_Interrupt (Self : in out GPIO_Line);

   overriding procedure Set_Callback
     (Self : in out GPIO_Line; Callback : A0B.Callbacks.Callback);

   overriding function Get (Self : GPIO_Line) return Boolean;

   overriding procedure Set (Self : GPIO_Line; To : Boolean);

   type GPIO_Controller
     (Peripheral : not null access A0B.STM32F401.SVD.GPIO.GPIO_Peripheral;
      Identifier : GPIO_Controller_Identifier) is
        limited null record;

private

   subtype GPIO_Alternative_Function is A0B.Types.Unsigned_4;

   type Line_Descriptor (Supported : Boolean := False) is record
      case Supported is
         when False =>
            null;

         when True =>
            Controller           : GPIO_Controller_Identifier;
            Line                 : GPIO_Line_Identifier;
            Alternative_Function : GPIO_Alternative_Function;
      end case;
   end record with Pack;

   type Line_Descriptor_Array is array (0 .. 2) of Line_Descriptor with Pack;

end A0B.STM32F401.GPIO;
