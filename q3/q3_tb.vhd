library ieee, std;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use std.textio.all;

-- initailising entity ASCII_Read_test for testbench
entity ASCII_Read_test is
end entity;

-- initialising architecture for ASCII_Read_test
architecture art of ASCII_Read_test is
	-- initialising signals which will be used in testbench
	signal signal_in: std_logic_vector (7 downto 0);
	signal signal_out: std_logic_vector (7 downto 0);
	signal reset : std_logic;
	signal dv : std_logic;
    signal clock : std_logic := '0';
	
	-- adding component CHORDEncoder for q3_CHORD.vhd
	component CHORDEncoder
	    port(clk, rst: in std_logic;
	    a: in std_logic_vector(7 downto 0);
	    data_valid: out std_logic;
	    z: out std_logic_vector(7 downto 0));
	end component;

-- executing testbench
begin
	dut_instance: CHORDEncoder
		port map (a => signal_in, clk => clock, z => signal_out, data_valid => dv, rst => reset);	
	process
		file input_file: text open read_mode is "test.txt";
		file output_file: text open write_mode is "out.txt";
		variable input_line, output_line: line;
		variable input_var, output_var : std_logic_vector (7 downto 0);	
	begin
		while not endfile(input_file) loop
            readline (input_file, input_line);
			read (input_line, input_var);
			signal_in <= input_var;
			wait for 5 ns;
			clock <= '1';
			wait for 5 ns;
			clock <= '0';
			wait for 5 ns;
            if dv = '1' and signal_out /= "00000000" then
			output_var := signal_out;
			write (output_line, output_var);
			writeline (output_file, output_line);
			wait for 5 ns;
            end if;
		end loop;
        while dv = '1' or signal_out = "00000000" loop
            clock <= '1';
			wait for 5 ns;
			clock <= '0';
			wait for 5 ns;
            if dv = '1' and signal_out /= "00000000" then
            output_var := signal_out;
			write (output_line, output_var);
			writeline (output_file, output_line);
			wait for 5 ns;
            elsif dv = '0' then
                exit;
            end if;
        end loop;
	wait;
	end process;
end architecture;