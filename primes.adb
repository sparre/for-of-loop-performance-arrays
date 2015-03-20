with Ada.Integer_Text_IO,
     Ada.Text_IO;

procedure Primes is
   Result : array (1 .. 1_000_000) of Positive;
   Count  : Positive;
   Last   : Positive;
   Prime  : Boolean;
begin
   Result (1) := 2;
   Result (2) := 3;
   Count      := 2;
   Last       := 3;

   Find_Primes :
   loop
      Last := Last + 2;
      Prime := True;

      Check_Divisible :
      for Divisor of Result (2 .. Count) loop
         exit Check_Divisible when Divisor * Divisor > Last;

         if Last mod Divisor = 0 then
            Prime := False;
            exit Check_Divisible;
         end if;
      end loop Check_Divisible;

      if Prime then
         Count := Count + 1;
         Result (Count) := Last;

         if (Count - 1) mod 100_000 = 0 then
            Ada.Integer_Text_IO.Put (Last);
            Ada.Text_IO.New_Line;
         end if;

         exit Find_Primes when Last > 9_999_999;
      end if;
   end loop Find_Primes;

   Ada.Text_IO.Put ("Total: ");
   Ada.Integer_Text_IO.Put (Count);
   Ada.Text_IO.Put_Line (" primes");
end Primes;
