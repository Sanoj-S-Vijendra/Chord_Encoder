library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.std_logic_textio.ALL;
use std.textio.ALL;

-- creating CHORDEncoder entity
entity CHORDEncoder is
    port (clk, rst : in std_logic;
        a : in std_logic_vector(7 downto 0);
        data_valid : out std_logic;
        z : out std_logic_vector(7 downto 0));
end entity;

-- creating architecture for CHORDEncoder
architecture chords of CHORDEncoder is
    type inputbuffer is array (0 to 32) of std_logic_vector (7 downto 0); -- defing a type 
    type outputbuffer is array (0 to 32) of std_logic_vector (7 downto 0); -- defining a type
    type charts is array(0 to 35) of std_logic_vector (7 downto 0); -- defining a type
    signal major_chords : std_logic_vector(7 downto 0) := "01001101";  -- M
    signal sharp_chords : std_logic_vector(7 downto 0) := "00011111"; -- #
    signal suspended_chords : std_logic_vector(7 downto 0) := "01110011"; -- s
    signal seventh_chord : std_logic_vector(7 downto 0) := "00110111"; -- 7
    signal minor_chords : std_logic_vector(7 downto 0) := "01101101"; -- m

    -- making tables for capitall and small
    signal trial1 : charts; -- for capital
    signal trail2 : charts; -- for small
begin
    -- trail1
    trial1 <= ("01000011", "01100100", "01000100", "01100101", "01000101",
               "01000110", "01100111", "01000111", "01100001", "01000001",
               "01100010", "01000010", "01000011", "01100100", "01000100",
               "01100101", "01000101", "01000110", "01100111", "01000111",
               "01100001", "01000001", "01100010", "01000010", "01000011",
               "01100100", "01000100", "01100101", "01000101", "01000110",
               "01100111", "01000111", "01100001", "01000001", "01100010",
               "01000010");
    -- trail2
    trail2 <= ("01000011", "01100100", "01000100", "01100101", "01100110",
               "01000110", "01100111", "01000111", "01100001", "01000001",
               "01100010", "01100011", "01000011", "01100100", "01000100",
               "01100101", "01100110", "01000110", "01100111", "01000111",
               "01100001", "01000001", "01100010", "01100011", "01000011",
               "01100100", "01000100", "01100101", "01100110", "01000110",
               "01100111", "01000111", "01100001", "01000001", "01100010", 
               "01100011");

    -- running the actual execution
    chording :
    process (clk, rst)
        file input_file : text open read_mode is "test.txt"; -- opening the file
        variable inputbuf : inputbuffer; -- initialising 2-D array to store input
        variable outputbuf : outputbuffer; -- initialising 2-D array to store output
        variable t1 : integer;
        variable t2 : integer;
        variable t3 : integer;
        variable v1 : integer := 0;
        variable v2 : integer := 1;
        variable v3 : integer := 0; -- indexnumber for storing the input in inputbuf
        variable v4 : integer := 0;
        variable v5 : integer := 0;
        variable alpha : integer := 0;       
        variable line_input : line; -- reading the line
        variable n : integer;
        variable f1 : boolean := true;
        variable f2 : boolean := true;
        variable adder : integer := 0;
    begin

        
        if rising_edge(clk) then
            if not endfile(input_file) then
                readline (input_file, line_input);
                inputbuf(v3) := a;
                v3 := v3 + 1;
            end if;
            if v2 <= v3 then
                case v1 is
                    when 0 =>
                        if v3 /= 1 then
                            t1 := 0;
                            if inputbuf(v2) = sharp_chords then                   
                                for kl in 0 to 35 loop
                                    if inputbuf(v2 - 1) = trial1(kl) or inputbuf(v2 - 1) = trail2(kl) then
                                        t1 := kl + 1;
                                        exit;
                                    end if;
                                end loop;
                                if t1 /= 0 then
                                    v1 := 1;
                                    outputbuf(v4) := inputbuf(v2 - 1);
                                    outputbuf(v4 + 1) := inputbuf(v2);
                                    v2 := v2 + 2;
                                    v4 := v4 + 2;
                                    adder := adder + 2;
                                end if;
                            else
                                for kl in integer range 0 to 35 loop
                                    if inputbuf(v2 - 1) = trail2(kl) or inputbuf(v2 - 1) = trial1(kl) then
                                        t1 := kl;
                                        exit;
                                    end if;
                                end loop;
                                v1 := 1;
                                outputbuf(v4) := inputbuf(v2 - 1);
                                v2 := v2 + 1;
                                v4 := v4 + 1;
                                adder := adder + 1;
                            end if;
                        end if;
                    when 1 =>
                        t2:= 0;
                        for kl in t1 to 35 loop
                            if (inputbuf(v2 - 1) = trail2(kl) or inputbuf(v2 - 1) = trial1(kl)) then
                                t2 := kl;
                                exit;
                            end if;
                        end loop;        
                        if inputbuf(v2) = sharp_chords then
                            for kl in t1 to 35 loop
                                if inputbuf(v2 - 1) = trail2(kl) or inputbuf(v2 - 1) = trial1(kl) then
                                    t2 := kl + 1;
                                    exit;
                                end if;
                            end loop;
                        end if;
                        if (t2 - t1 = 5 or t2 - t1 = 3 or t2 - t1 = 4) and inputbuf(v2) /= sharp_chords then
                            v1 := 2;
                            v2 := v2 + 1;
                        elsif (t2 - t1 = 5 or t2 - t1 = 3 or t2 - t1 = 4) and inputbuf(v2) = sharp_chords then
                            v1 := 2;
                            v2 := v2 + 2;
                        else
                            v1 := 0;
                        end if;
                    when 2 =>
                        for kl in t2 to 35 loop
                            if inputbuf(v2 - 1) = trial1(kl) or inputbuf(v2 - 1) = trail2(kl) then
                                t3 := kl;
                                exit;
                            end if;
                        end loop;
                        if inputbuf(v2) = sharp_chords then
                            for kl in t2 to 35 loop
                                if inputbuf(v2 - 1) = trial1(kl) or inputbuf(v2 - 1) = trail2(kl) then
                                    t3 := kl + 1;
                                    exit;
                                end if;
                            end loop;                    
                        end if;                        
                        if t3 - t2 = 4 and t2 - t1 = 3 then
                            alpha := 1;
                            v1 := 0;
                            outputbuf(v4) := minor_chords;
                            v4 := v4 + 1;                  
                        elsif t3 - t2 = 2 and t2 - t1 = 5 then
                            alpha := 1;
                            v1 := 0;
                            outputbuf(v4) := suspended_chords;
                            v4 := v4 + 1;                    
                        elsif t3 - t2 = 3 and t2 - t1 = 4 then
                            alpha := 1;
                            v1 := 3;
                        else
                            alpha := 0;
                            v1 := 0;
                            if inputbuf(v2 - 2) /= sharp_chords then
                                v2 := v2 - 1;
                            else
                                v2 := v2 - 2;
                            end if;
                        end if;
                        if alpha = 1 then
                            if inputbuf(v2) = sharp_chords then
                                adder := v2;
                                v2 := v2 + 2;
                            else
                                adder := v2 - 1;
                                v2 := v2 + 1;
                            end if;
                        end if;
                    when 3 =>
                        for kl in t3 to 35 loop
                            if inputbuf(v2 - 1) = trail2(kl) or inputbuf(v2 - 1) = trial1(kl) then
                                n := kl;
                                exit;
                            end if;
                        end loop;
                        if inputbuf(v2) = sharp_chords then
                            for kl in t3 to 35 loop
                                if inputbuf(v2 - 1) = trail2(kl) or inputbuf(v2 - 1) = trial1(kl) then
                                    n := kl + 1;
                                    exit;
                                end if;
                            end loop;
                        end if;
                        alpha := 0;
                        if n - t3 = 3 then
                            alpha := 1;
                            outputbuf(v4) := seventh_chord;
                        else
                            outputbuf(v4) := major_chords;                    
                            alpha := 0;
                        end if;
                        if alpha = 1 then
                            if inputbuf(v2) = sharp_chords then
                                adder := v2;
                                v2 := v2 + 2;
                            else
                                adder := v2 - 1;
                                v2 := v2 + 1;
                            end if;
                        end if;
                        v1 := 0;
                        v4 := v4 + 1;
                    when others =>
                        null;
                end case;
            elsif v2 /= 1 then
                f1 := false;
            end if;
        end if;
        if f1 = false and f2 = true then
            for i in adder + 1 to v3 - 1 loop
                outputbuf(v4) := inputbuf(i);
                v4 := v4 + 1;
            end loop;
            f2 := false;
        end if;
        if falling_edge(clk) then
            if v5 < v4 then
                z <= outputbuf(v5);
                data_valid <= '1';
                v5 := v5 + 1;
            elsif v2 <= v3 + 1 and f1 = true then
                z <= "00000000";
                data_valid <= '1';
            else
                data_valid <= '0';
            end if;
        end if;
    end process;
end architecture;