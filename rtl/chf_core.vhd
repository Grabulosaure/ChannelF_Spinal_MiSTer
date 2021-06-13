-- Generator : SpinalHDL v1.4.3    git head : adf552d8f500e7419fff395b7049228e4bc5de26
-- Component : chf_core
-- Git hash  : e03a66e8f94607b5b85df824187b35e3c8c2028f

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

package pkg_enum is
  type EnumLen is (S,L);
  type EnumInt is (I0,IX,IY);
  type EnumOp is (OP_NOP,OP_MOV,OP_ADD,OP_ADDD,OP_AND,OP_OR,OP_XOR,OP_CMP,OP_SR1,OP_SL1,OP_SR4,OP_SL4,OP_COM,OP_LNK,OP_EDI,OP_INC,OP_DEC,OP_LIS,OP_TST8,OP_TST9);

  function pkg_mux (sel : std_logic; one : EnumLen; zero : EnumLen) return EnumLen;
  function pkg_toStdLogicVector_defaultEncoding (value : EnumLen) return std_logic_vector;
  function pkg_toEnumLen_defaultEncoding (value : std_logic_vector(0 downto 0)) return EnumLen;
  function pkg_mux (sel : std_logic; one : EnumInt; zero : EnumInt) return EnumInt;
  function pkg_toStdLogicVector_defaultEncoding (value : EnumInt) return std_logic_vector;
  function pkg_toEnumInt_defaultEncoding (value : std_logic_vector(1 downto 0)) return EnumInt;
  function pkg_mux (sel : std_logic; one : EnumOp; zero : EnumOp) return EnumOp;
  function pkg_toStdLogicVector_defaultEncoding (value : EnumOp) return std_logic_vector;
  function pkg_toEnumOp_defaultEncoding (value : std_logic_vector(4 downto 0)) return EnumOp;
end pkg_enum;

package body pkg_enum is
  function pkg_mux (sel : std_logic; one : EnumLen; zero : EnumLen) return EnumLen is
  begin
    if sel = '1' then
      return one;
    else
      return zero;
    end if;
  end pkg_mux;

  function pkg_toEnumLen_defaultEncoding (value : std_logic_vector(0 downto 0)) return EnumLen is
  begin
    case value is
      when "0" => return S;
      when "1" => return L;
      when others => return S;
    end case;
  end;
  function pkg_toStdLogicVector_defaultEncoding (value : EnumLen) return std_logic_vector is
  begin
    case value is
      when S => return "0";
      when L => return "1";
      when others => return "0";
    end case;
  end;
  function pkg_mux (sel : std_logic; one : EnumInt; zero : EnumInt) return EnumInt is
  begin
    if sel = '1' then
      return one;
    else
      return zero;
    end if;
  end pkg_mux;

  function pkg_toEnumInt_defaultEncoding (value : std_logic_vector(1 downto 0)) return EnumInt is
  begin
    case value is
      when "00" => return I0;
      when "01" => return IX;
      when "10" => return IY;
      when others => return I0;
    end case;
  end;
  function pkg_toStdLogicVector_defaultEncoding (value : EnumInt) return std_logic_vector is
  begin
    case value is
      when I0 => return "00";
      when IX => return "01";
      when IY => return "10";
      when others => return "00";
    end case;
  end;
  function pkg_mux (sel : std_logic; one : EnumOp; zero : EnumOp) return EnumOp is
  begin
    if sel = '1' then
      return one;
    else
      return zero;
    end if;
  end pkg_mux;

  function pkg_toEnumOp_defaultEncoding (value : std_logic_vector(4 downto 0)) return EnumOp is
  begin
    case value is
      when "00000" => return OP_NOP;
      when "00001" => return OP_MOV;
      when "00010" => return OP_ADD;
      when "00011" => return OP_ADDD;
      when "00100" => return OP_AND;
      when "00101" => return OP_OR;
      when "00110" => return OP_XOR;
      when "00111" => return OP_CMP;
      when "01000" => return OP_SR1;
      when "01001" => return OP_SL1;
      when "01010" => return OP_SR4;
      when "01011" => return OP_SL4;
      when "01100" => return OP_COM;
      when "01101" => return OP_LNK;
      when "01110" => return OP_EDI;
      when "01111" => return OP_INC;
      when "10000" => return OP_DEC;
      when "10001" => return OP_LIS;
      when "10010" => return OP_TST8;
      when "10011" => return OP_TST9;
      when others => return OP_NOP;
    end case;
  end;
  function pkg_toStdLogicVector_defaultEncoding (value : EnumOp) return std_logic_vector is
  begin
    case value is
      when OP_NOP => return "00000";
      when OP_MOV => return "00001";
      when OP_ADD => return "00010";
      when OP_ADDD => return "00011";
      when OP_AND => return "00100";
      when OP_OR => return "00101";
      when OP_XOR => return "00110";
      when OP_CMP => return "00111";
      when OP_SR1 => return "01000";
      when OP_SL1 => return "01001";
      when OP_SR4 => return "01010";
      when OP_SL4 => return "01011";
      when OP_COM => return "01100";
      when OP_LNK => return "01101";
      when OP_EDI => return "01110";
      when OP_INC => return "01111";
      when OP_DEC => return "10000";
      when OP_LIS => return "10001";
      when OP_TST8 => return "10010";
      when OP_TST9 => return "10011";
      when others => return "00000";
    end case;
  end;
end pkg_enum;


library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

package pkg_scala2hdl is
  function pkg_extract (that : std_logic_vector; bitId : integer) return std_logic;
  function pkg_extract (that : std_logic_vector; base : unsigned; size : integer) return std_logic_vector;
  function pkg_cat (a : std_logic_vector; b : std_logic_vector) return std_logic_vector;
  function pkg_not (value : std_logic_vector) return std_logic_vector;
  function pkg_extract (that : unsigned; bitId : integer) return std_logic;
  function pkg_extract (that : unsigned; base : unsigned; size : integer) return unsigned;
  function pkg_cat (a : unsigned; b : unsigned) return unsigned;
  function pkg_not (value : unsigned) return unsigned;
  function pkg_extract (that : signed; bitId : integer) return std_logic;
  function pkg_extract (that : signed; base : unsigned; size : integer) return signed;
  function pkg_cat (a : signed; b : signed) return signed;
  function pkg_not (value : signed) return signed;

  function pkg_mux (sel : std_logic; one : std_logic; zero : std_logic) return std_logic;
  function pkg_mux (sel : std_logic; one : std_logic_vector; zero : std_logic_vector) return std_logic_vector;
  function pkg_mux (sel : std_logic; one : unsigned; zero : unsigned) return unsigned;
  function pkg_mux (sel : std_logic; one : signed; zero : signed) return signed;

  function pkg_toStdLogic (value : boolean) return std_logic;
  function pkg_toStdLogicVector (value : std_logic) return std_logic_vector;
  function pkg_toUnsigned (value : std_logic) return unsigned;
  function pkg_toSigned (value : std_logic) return signed;
  function pkg_stdLogicVector (lit : std_logic_vector) return std_logic_vector;
  function pkg_unsigned (lit : unsigned) return unsigned;
  function pkg_signed (lit : signed) return signed;

  function pkg_resize (that : std_logic_vector; width : integer) return std_logic_vector;
  function pkg_resize (that : unsigned; width : integer) return unsigned;
  function pkg_resize (that : signed; width : integer) return signed;

  function pkg_extract (that : std_logic_vector; high : integer; low : integer) return std_logic_vector;
  function pkg_extract (that : unsigned; high : integer; low : integer) return unsigned;
  function pkg_extract (that : signed; high : integer; low : integer) return signed;

  function pkg_shiftRight (that : std_logic_vector; size : natural) return std_logic_vector;
  function pkg_shiftRight (that : std_logic_vector; size : unsigned) return std_logic_vector;
  function pkg_shiftLeft (that : std_logic_vector; size : natural) return std_logic_vector;
  function pkg_shiftLeft (that : std_logic_vector; size : unsigned) return std_logic_vector;

  function pkg_shiftRight (that : unsigned; size : natural) return unsigned;
  function pkg_shiftRight (that : unsigned; size : unsigned) return unsigned;
  function pkg_shiftLeft (that : unsigned; size : natural) return unsigned;
  function pkg_shiftLeft (that : unsigned; size : unsigned) return unsigned;

  function pkg_shiftRight (that : signed; size : natural) return signed;
  function pkg_shiftRight (that : signed; size : unsigned) return signed;
  function pkg_shiftLeft (that : signed; size : natural) return signed;
  function pkg_shiftLeft (that : signed; size : unsigned; w : integer) return signed;

  function pkg_rotateLeft (that : std_logic_vector; size : unsigned) return std_logic_vector;
end  pkg_scala2hdl;

package body pkg_scala2hdl is
  function pkg_extract (that : std_logic_vector; bitId : integer) return std_logic is
  begin
    return that(bitId);
  end pkg_extract;

  function pkg_extract (that : std_logic_vector; base : unsigned; size : integer) return std_logic_vector is
   constant elementCount : integer := (that'length-size)+1;
   type tableType is array (0 to elementCount-1) of std_logic_vector(size-1 downto 0);
   variable table : tableType;
  begin
    for i in 0 to elementCount-1 loop
      table(i) := that(i + size - 1 downto i);
    end loop;
    return table(to_integer(base));
  end pkg_extract;

  function pkg_cat (a : std_logic_vector; b : std_logic_vector) return std_logic_vector is
    variable cat : std_logic_vector(a'length + b'length-1 downto 0);
  begin
    cat := a & b;
    return cat;
  end pkg_cat;

  function pkg_not (value : std_logic_vector) return std_logic_vector is
    variable ret : std_logic_vector(value'length-1 downto 0);
  begin
    ret := not value;
    return ret;
  end pkg_not;

  function pkg_extract (that : unsigned; bitId : integer) return std_logic is
  begin
    return that(bitId);
  end pkg_extract;

  function pkg_extract (that : unsigned; base : unsigned; size : integer) return unsigned is
   constant elementCount : integer := (that'length-size)+1;
   type tableType is array (0 to elementCount-1) of unsigned(size-1 downto 0);
   variable table : tableType;
  begin
    for i in 0 to elementCount-1 loop
      table(i) := that(i + size - 1 downto i);
    end loop;
    return table(to_integer(base));
  end pkg_extract;

  function pkg_cat (a : unsigned; b : unsigned) return unsigned is
    variable cat : unsigned(a'length + b'length-1 downto 0);
  begin
    cat := a & b;
    return cat;
  end pkg_cat;

  function pkg_not (value : unsigned) return unsigned is
    variable ret : unsigned(value'length-1 downto 0);
  begin
    ret := not value;
    return ret;
  end pkg_not;

  function pkg_extract (that : signed; bitId : integer) return std_logic is
  begin
    return that(bitId);
  end pkg_extract;

  function pkg_extract (that : signed; base : unsigned; size : integer) return signed is
   constant elementCount : integer := (that'length-size)+1;
   type tableType is array (0 to elementCount-1) of signed(size-1 downto 0);
   variable table : tableType;
  begin
    for i in 0 to elementCount-1 loop
      table(i) := that(i + size - 1 downto i);
    end loop;
    return table(to_integer(base));
  end pkg_extract;

  function pkg_cat (a : signed; b : signed) return signed is
    variable cat : signed(a'length + b'length-1 downto 0);
  begin
    cat := a & b;
    return cat;
  end pkg_cat;

  function pkg_not (value : signed) return signed is
    variable ret : signed(value'length-1 downto 0);
  begin
    ret := not value;
    return ret;
  end pkg_not;


  -- unsigned shifts
  function pkg_shiftRight (that : unsigned; size : natural) return unsigned is
  begin
    if size >= that'length then
      return "";
    else
      return shift_right(that,size)(that'length-1-size downto 0);
    end if;
  end pkg_shiftRight;

  function pkg_shiftRight (that : unsigned; size : unsigned) return unsigned is
  begin
    return shift_right(that,to_integer(size));
  end pkg_shiftRight;

  function pkg_shiftLeft (that : unsigned; size : natural) return unsigned is
  begin
    return shift_left(resize(that,that'length + size),size);
  end pkg_shiftLeft;

  function pkg_shiftLeft (that : unsigned; size : unsigned) return unsigned is
  begin
    return shift_left(resize(that,that'length + 2**size'length - 1),to_integer(size));
  end pkg_shiftLeft;

  -- std_logic_vector shifts
  function pkg_shiftRight (that : std_logic_vector; size : natural) return std_logic_vector is
  begin
    return std_logic_vector(pkg_shiftRight(unsigned(that),size));
  end pkg_shiftRight;

  function pkg_shiftRight (that : std_logic_vector; size : unsigned) return std_logic_vector is
  begin
    return std_logic_vector(pkg_shiftRight(unsigned(that),size));
  end pkg_shiftRight;

  function pkg_shiftLeft (that : std_logic_vector; size : natural) return std_logic_vector is
  begin
    return std_logic_vector(pkg_shiftLeft(unsigned(that),size));
  end pkg_shiftLeft;

  function pkg_shiftLeft (that : std_logic_vector; size : unsigned) return std_logic_vector is
  begin
    return std_logic_vector(pkg_shiftLeft(unsigned(that),size));
  end pkg_shiftLeft;

  -- signed shifts
  function pkg_shiftRight (that : signed; size : natural) return signed is
  begin
    return signed(pkg_shiftRight(unsigned(that),size));
  end pkg_shiftRight;

  function pkg_shiftRight (that : signed; size : unsigned) return signed is
  begin
    return shift_right(that,to_integer(size));
  end pkg_shiftRight;

  function pkg_shiftLeft (that : signed; size : natural) return signed is
  begin
    return signed(pkg_shiftLeft(unsigned(that),size));
  end pkg_shiftLeft;

  function pkg_shiftLeft (that : signed; size : unsigned; w : integer) return signed is
  begin
    return shift_left(resize(that,w),to_integer(size));
  end pkg_shiftLeft;

  function pkg_rotateLeft (that : std_logic_vector; size : unsigned) return std_logic_vector is
  begin
    return std_logic_vector(rotate_left(unsigned(that),to_integer(size)));
  end pkg_rotateLeft;

  function pkg_extract (that : std_logic_vector; high : integer; low : integer) return std_logic_vector is
    variable temp : std_logic_vector(high-low downto 0);
  begin
    temp := that(high downto low);
    return temp;
  end pkg_extract;

  function pkg_extract (that : unsigned; high : integer; low : integer) return unsigned is
    variable temp : unsigned(high-low downto 0);
  begin
    temp := that(high downto low);
    return temp;
  end pkg_extract;

  function pkg_extract (that : signed; high : integer; low : integer) return signed is
    variable temp : signed(high-low downto 0);
  begin
    temp := that(high downto low);
    return temp;
  end pkg_extract;

  function pkg_mux (sel : std_logic; one : std_logic; zero : std_logic) return std_logic is
  begin
    if sel = '1' then
      return one;
    else
      return zero;
    end if;
  end pkg_mux;

  function pkg_mux (sel : std_logic; one : std_logic_vector; zero : std_logic_vector) return std_logic_vector is
    variable ret : std_logic_vector(zero'range);
  begin
    if sel = '1' then
      ret := one;
    else
      ret := zero;
    end if;
    return ret;
  end pkg_mux;

  function pkg_mux (sel : std_logic; one : unsigned; zero : unsigned) return unsigned is
    variable ret : unsigned(zero'range);
  begin
    if sel = '1' then
      ret := one;
    else
      ret := zero;
    end if;
    return ret;
  end pkg_mux;

  function pkg_mux (sel : std_logic; one : signed; zero : signed) return signed is
    variable ret : signed(zero'range);
  begin
    if sel = '1' then
      ret := one;
    else
      ret := zero;
    end if;
    return ret;
  end pkg_mux;

  function pkg_toStdLogic (value : boolean) return std_logic is
  begin
    if value = true then
      return '1';
    else
      return '0';
    end if;
  end pkg_toStdLogic;

  function pkg_toStdLogicVector (value : std_logic) return std_logic_vector is
    variable ret : std_logic_vector(0 downto 0);
  begin
    ret(0) := value;
    return ret;
  end pkg_toStdLogicVector;

  function pkg_toUnsigned (value : std_logic) return unsigned is
    variable ret : unsigned(0 downto 0);
  begin
    ret(0) := value;
    return ret;
  end pkg_toUnsigned;

  function pkg_toSigned (value : std_logic) return signed is
    variable ret : signed(0 downto 0);
  begin
    ret(0) := value;
    return ret;
  end pkg_toSigned;

  function pkg_stdLogicVector (lit : std_logic_vector) return std_logic_vector is
    variable ret : std_logic_vector(lit'length-1 downto 0);
  begin
    ret := lit;
    return ret;
  end pkg_stdLogicVector;

  function pkg_unsigned (lit : unsigned) return unsigned is
    variable ret : unsigned(lit'length-1 downto 0);
  begin
    ret := lit;
    return ret;
  end pkg_unsigned;

  function pkg_signed (lit : signed) return signed is
    variable ret : signed(lit'length-1 downto 0);
  begin
    ret := lit;
    return ret;
  end pkg_signed;

  function pkg_resize (that : std_logic_vector; width : integer) return std_logic_vector is
  begin
    return std_logic_vector(resize(unsigned(that),width));
  end pkg_resize;

  function pkg_resize (that : unsigned; width : integer) return unsigned is
    variable ret : unsigned(width-1 downto 0);
  begin
    if that'length = 0 then
       ret := (others => '0');
    else
       ret := resize(that,width);
    end if;
    return ret;
  end pkg_resize;
  function pkg_resize (that : signed; width : integer) return signed is
    variable ret : signed(width-1 downto 0);
  begin
    if that'length = 0 then
       ret := (others => '0');
    elsif that'length >= width then
       ret := that(width-1 downto 0);
    else
       ret := resize(that,width);
    end if;
    return ret;
  end pkg_resize;
end pkg_scala2hdl;


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity aluop is
  port(
    io_op : in EnumOp;
    io_code : in unsigned(7 downto 0);
    io_src1 : in unsigned(7 downto 0);
    io_src2 : in unsigned(7 downto 0);
    io_iozcs_i : in unsigned(4 downto 0);
    io_dst : out unsigned(7 downto 0);
    io_dstm : out std_logic;
    io_iozcs_o : out unsigned(4 downto 0);
    io_test : out std_logic
  );
end aluop;

architecture arch of aluop is
  signal zz_3 : std_logic;
  signal zz_4 : std_logic;
  signal zz_5 : unsigned(2 downto 0);
  signal zz_6 : unsigned(3 downto 0);

  signal dst_v_18 : unsigned(7 downto 0);
  signal dst_v_17 : unsigned(7 downto 0);
  signal dst_v_16 : unsigned(7 downto 0);
  signal dst9_v_6 : unsigned(8 downto 0);
  signal dst_v_15 : unsigned(7 downto 0);
  signal dst9_v_5 : unsigned(8 downto 0);
  signal dst_v_14 : unsigned(7 downto 0);
  signal dst_v_13 : unsigned(7 downto 0);
  signal dst_v_12 : unsigned(7 downto 0);
  signal dst_v_11 : unsigned(7 downto 0);
  signal dst_v_10 : unsigned(7 downto 0);
  signal dst_v_9 : unsigned(7 downto 0);
  signal dst9_v_4 : unsigned(8 downto 0);
  signal dst_v_8 : unsigned(7 downto 0);
  signal dst_v_7 : unsigned(7 downto 0);
  signal dst_v_6 : unsigned(7 downto 0);
  signal dst9_v_3 : unsigned(8 downto 0);
  signal dst_v_5 : unsigned(7 downto 0);
  signal dst_v_4 : unsigned(7 downto 0);
  signal dst_v_3 : unsigned(7 downto 0);
  signal dst_v_2 : unsigned(7 downto 0);
  signal tic_v_1 : std_logic;
  signal tc_v_1 : std_logic;
  signal dst9_v_2 : unsigned(8 downto 0);
  signal dst_v_1 : unsigned(7 downto 0);
  signal dst9_v_1 : unsigned(8 downto 0);
  signal dst_v : unsigned(7 downto 0);
  signal dst9_v : unsigned(8 downto 0);
  signal tc_v : std_logic;
  signal tic_v : std_logic;
  signal zz_1 : std_logic;
  signal zz_2 : std_logic;
begin
  zz_3 <= ((not tc_v_1) and (not tic_v_1));
  zz_4 <= ((not tc_v_1) and tic_v_1);
  zz_5 <= pkg_extract(io_code,2,0);
  zz_6 <= pkg_extract(io_code,3,0);
  process(dst_v_17,io_op,io_src2)
  begin
    dst_v_18 <= dst_v_17;
    case io_op is
      when pkg_enum.OP_ADD =>
      when pkg_enum.OP_ADDD =>
      when pkg_enum.OP_CMP =>
      when pkg_enum.OP_AND =>
      when pkg_enum.OP_OR =>
      when pkg_enum.OP_XOR =>
      when pkg_enum.OP_DEC =>
      when pkg_enum.OP_SL1 =>
      when pkg_enum.OP_SL4 =>
      when pkg_enum.OP_SR1 =>
      when pkg_enum.OP_SR4 =>
      when pkg_enum.OP_COM =>
      when pkg_enum.OP_LNK =>
      when pkg_enum.OP_INC =>
      when pkg_enum.OP_EDI =>
      when pkg_enum.OP_LIS =>
      when pkg_enum.OP_TST8 =>
      when pkg_enum.OP_TST9 =>
      when pkg_enum.OP_NOP =>
      when others =>
        dst_v_18 <= io_src2;
    end case;
  end process;

  process(dst_v_16,io_op,io_code)
  begin
    dst_v_17 <= dst_v_16;
    case io_op is
      when pkg_enum.OP_ADD =>
      when pkg_enum.OP_ADDD =>
      when pkg_enum.OP_CMP =>
      when pkg_enum.OP_AND =>
      when pkg_enum.OP_OR =>
      when pkg_enum.OP_XOR =>
      when pkg_enum.OP_DEC =>
      when pkg_enum.OP_SL1 =>
      when pkg_enum.OP_SL4 =>
      when pkg_enum.OP_SR1 =>
      when pkg_enum.OP_SR4 =>
      when pkg_enum.OP_COM =>
      when pkg_enum.OP_LNK =>
      when pkg_enum.OP_INC =>
      when pkg_enum.OP_EDI =>
      when pkg_enum.OP_LIS =>
        dst_v_17 <= unsigned(pkg_cat(std_logic_vector(pkg_unsigned("0000")),std_logic_vector(pkg_extract(io_code,3,0))));
      when pkg_enum.OP_TST8 =>
      when pkg_enum.OP_TST9 =>
      when pkg_enum.OP_NOP =>
      when others =>
    end case;
  end process;

  process(dst_v_15,io_op,dst9_v_6)
  begin
    dst_v_16 <= dst_v_15;
    case io_op is
      when pkg_enum.OP_ADD =>
      when pkg_enum.OP_ADDD =>
      when pkg_enum.OP_CMP =>
      when pkg_enum.OP_AND =>
      when pkg_enum.OP_OR =>
      when pkg_enum.OP_XOR =>
      when pkg_enum.OP_DEC =>
      when pkg_enum.OP_SL1 =>
      when pkg_enum.OP_SL4 =>
      when pkg_enum.OP_SR1 =>
      when pkg_enum.OP_SR4 =>
      when pkg_enum.OP_COM =>
      when pkg_enum.OP_LNK =>
      when pkg_enum.OP_INC =>
        dst_v_16 <= pkg_extract(dst9_v_6,7,0);
      when pkg_enum.OP_EDI =>
      when pkg_enum.OP_LIS =>
      when pkg_enum.OP_TST8 =>
      when pkg_enum.OP_TST9 =>
      when pkg_enum.OP_NOP =>
      when others =>
    end case;
  end process;

  process(dst9_v_5,io_op,io_src1)
  begin
    dst9_v_6 <= dst9_v_5;
    case io_op is
      when pkg_enum.OP_ADD =>
      when pkg_enum.OP_ADDD =>
      when pkg_enum.OP_CMP =>
      when pkg_enum.OP_AND =>
      when pkg_enum.OP_OR =>
      when pkg_enum.OP_XOR =>
      when pkg_enum.OP_DEC =>
      when pkg_enum.OP_SL1 =>
      when pkg_enum.OP_SL4 =>
      when pkg_enum.OP_SR1 =>
      when pkg_enum.OP_SR4 =>
      when pkg_enum.OP_COM =>
      when pkg_enum.OP_LNK =>
      when pkg_enum.OP_INC =>
        dst9_v_6 <= (unsigned(pkg_cat(std_logic_vector(pkg_unsigned("0")),std_logic_vector(io_src1))) + pkg_unsigned("000000001"));
      when pkg_enum.OP_EDI =>
      when pkg_enum.OP_LIS =>
      when pkg_enum.OP_TST8 =>
      when pkg_enum.OP_TST9 =>
      when pkg_enum.OP_NOP =>
      when others =>
    end case;
  end process;

  process(dst_v_14,io_op,dst9_v_5)
  begin
    dst_v_15 <= dst_v_14;
    case io_op is
      when pkg_enum.OP_ADD =>
      when pkg_enum.OP_ADDD =>
      when pkg_enum.OP_CMP =>
      when pkg_enum.OP_AND =>
      when pkg_enum.OP_OR =>
      when pkg_enum.OP_XOR =>
      when pkg_enum.OP_DEC =>
      when pkg_enum.OP_SL1 =>
      when pkg_enum.OP_SL4 =>
      when pkg_enum.OP_SR1 =>
      when pkg_enum.OP_SR4 =>
      when pkg_enum.OP_COM =>
      when pkg_enum.OP_LNK =>
        dst_v_15 <= pkg_extract(dst9_v_5,7,0);
      when pkg_enum.OP_INC =>
      when pkg_enum.OP_EDI =>
      when pkg_enum.OP_LIS =>
      when pkg_enum.OP_TST8 =>
      when pkg_enum.OP_TST9 =>
      when pkg_enum.OP_NOP =>
      when others =>
    end case;
  end process;

  process(dst9_v_4,io_op,io_src1,io_iozcs_i)
  begin
    dst9_v_5 <= dst9_v_4;
    case io_op is
      when pkg_enum.OP_ADD =>
      when pkg_enum.OP_ADDD =>
      when pkg_enum.OP_CMP =>
      when pkg_enum.OP_AND =>
      when pkg_enum.OP_OR =>
      when pkg_enum.OP_XOR =>
      when pkg_enum.OP_DEC =>
      when pkg_enum.OP_SL1 =>
      when pkg_enum.OP_SL4 =>
      when pkg_enum.OP_SR1 =>
      when pkg_enum.OP_SR4 =>
      when pkg_enum.OP_COM =>
      when pkg_enum.OP_LNK =>
        dst9_v_5 <= (unsigned(pkg_cat(std_logic_vector(pkg_unsigned("0")),std_logic_vector(io_src1))) + pkg_resize(unsigned(pkg_cat(std_logic_vector(pkg_unsigned("0")),pkg_toStdLogicVector(pkg_extract(io_iozcs_i,1)))),9));
      when pkg_enum.OP_INC =>
      when pkg_enum.OP_EDI =>
      when pkg_enum.OP_LIS =>
      when pkg_enum.OP_TST8 =>
      when pkg_enum.OP_TST9 =>
      when pkg_enum.OP_NOP =>
      when others =>
    end case;
  end process;

  process(dst_v_13,io_op,io_src1)
  begin
    dst_v_14 <= dst_v_13;
    case io_op is
      when pkg_enum.OP_ADD =>
      when pkg_enum.OP_ADDD =>
      when pkg_enum.OP_CMP =>
      when pkg_enum.OP_AND =>
      when pkg_enum.OP_OR =>
      when pkg_enum.OP_XOR =>
      when pkg_enum.OP_DEC =>
      when pkg_enum.OP_SL1 =>
      when pkg_enum.OP_SL4 =>
      when pkg_enum.OP_SR1 =>
      when pkg_enum.OP_SR4 =>
      when pkg_enum.OP_COM =>
        dst_v_14 <= pkg_not(io_src1);
      when pkg_enum.OP_LNK =>
      when pkg_enum.OP_INC =>
      when pkg_enum.OP_EDI =>
      when pkg_enum.OP_LIS =>
      when pkg_enum.OP_TST8 =>
      when pkg_enum.OP_TST9 =>
      when pkg_enum.OP_NOP =>
      when others =>
    end case;
  end process;

  process(dst_v_12,io_op,io_src1)
  begin
    dst_v_13 <= dst_v_12;
    case io_op is
      when pkg_enum.OP_ADD =>
      when pkg_enum.OP_ADDD =>
      when pkg_enum.OP_CMP =>
      when pkg_enum.OP_AND =>
      when pkg_enum.OP_OR =>
      when pkg_enum.OP_XOR =>
      when pkg_enum.OP_DEC =>
      when pkg_enum.OP_SL1 =>
      when pkg_enum.OP_SL4 =>
      when pkg_enum.OP_SR1 =>
      when pkg_enum.OP_SR4 =>
        dst_v_13 <= unsigned(pkg_cat(std_logic_vector(pkg_unsigned("0000")),std_logic_vector(pkg_extract(io_src1,7,4))));
      when pkg_enum.OP_COM =>
      when pkg_enum.OP_LNK =>
      when pkg_enum.OP_INC =>
      when pkg_enum.OP_EDI =>
      when pkg_enum.OP_LIS =>
      when pkg_enum.OP_TST8 =>
      when pkg_enum.OP_TST9 =>
      when pkg_enum.OP_NOP =>
      when others =>
    end case;
  end process;

  process(dst_v_11,io_op,io_src1)
  begin
    dst_v_12 <= dst_v_11;
    case io_op is
      when pkg_enum.OP_ADD =>
      when pkg_enum.OP_ADDD =>
      when pkg_enum.OP_CMP =>
      when pkg_enum.OP_AND =>
      when pkg_enum.OP_OR =>
      when pkg_enum.OP_XOR =>
      when pkg_enum.OP_DEC =>
      when pkg_enum.OP_SL1 =>
      when pkg_enum.OP_SL4 =>
      when pkg_enum.OP_SR1 =>
        dst_v_12 <= unsigned(pkg_cat(std_logic_vector(pkg_unsigned("0")),std_logic_vector(pkg_extract(io_src1,7,1))));
      when pkg_enum.OP_SR4 =>
      when pkg_enum.OP_COM =>
      when pkg_enum.OP_LNK =>
      when pkg_enum.OP_INC =>
      when pkg_enum.OP_EDI =>
      when pkg_enum.OP_LIS =>
      when pkg_enum.OP_TST8 =>
      when pkg_enum.OP_TST9 =>
      when pkg_enum.OP_NOP =>
      when others =>
    end case;
  end process;

  process(dst_v_10,io_op,io_src1)
  begin
    dst_v_11 <= dst_v_10;
    case io_op is
      when pkg_enum.OP_ADD =>
      when pkg_enum.OP_ADDD =>
      when pkg_enum.OP_CMP =>
      when pkg_enum.OP_AND =>
      when pkg_enum.OP_OR =>
      when pkg_enum.OP_XOR =>
      when pkg_enum.OP_DEC =>
      when pkg_enum.OP_SL1 =>
      when pkg_enum.OP_SL4 =>
        dst_v_11 <= unsigned(pkg_cat(std_logic_vector(pkg_extract(io_src1,3,0)),std_logic_vector(pkg_unsigned("0000"))));
      when pkg_enum.OP_SR1 =>
      when pkg_enum.OP_SR4 =>
      when pkg_enum.OP_COM =>
      when pkg_enum.OP_LNK =>
      when pkg_enum.OP_INC =>
      when pkg_enum.OP_EDI =>
      when pkg_enum.OP_LIS =>
      when pkg_enum.OP_TST8 =>
      when pkg_enum.OP_TST9 =>
      when pkg_enum.OP_NOP =>
      when others =>
    end case;
  end process;

  process(dst_v_9,io_op,io_src1)
  begin
    dst_v_10 <= dst_v_9;
    case io_op is
      when pkg_enum.OP_ADD =>
      when pkg_enum.OP_ADDD =>
      when pkg_enum.OP_CMP =>
      when pkg_enum.OP_AND =>
      when pkg_enum.OP_OR =>
      when pkg_enum.OP_XOR =>
      when pkg_enum.OP_DEC =>
      when pkg_enum.OP_SL1 =>
        dst_v_10 <= unsigned(pkg_cat(std_logic_vector(pkg_extract(io_src1,6,0)),std_logic_vector(pkg_unsigned("0"))));
      when pkg_enum.OP_SL4 =>
      when pkg_enum.OP_SR1 =>
      when pkg_enum.OP_SR4 =>
      when pkg_enum.OP_COM =>
      when pkg_enum.OP_LNK =>
      when pkg_enum.OP_INC =>
      when pkg_enum.OP_EDI =>
      when pkg_enum.OP_LIS =>
      when pkg_enum.OP_TST8 =>
      when pkg_enum.OP_TST9 =>
      when pkg_enum.OP_NOP =>
      when others =>
    end case;
  end process;

  process(dst_v_8,io_op,dst9_v_4)
  begin
    dst_v_9 <= dst_v_8;
    case io_op is
      when pkg_enum.OP_ADD =>
      when pkg_enum.OP_ADDD =>
      when pkg_enum.OP_CMP =>
      when pkg_enum.OP_AND =>
      when pkg_enum.OP_OR =>
      when pkg_enum.OP_XOR =>
      when pkg_enum.OP_DEC =>
        dst_v_9 <= pkg_extract(dst9_v_4,7,0);
      when pkg_enum.OP_SL1 =>
      when pkg_enum.OP_SL4 =>
      when pkg_enum.OP_SR1 =>
      when pkg_enum.OP_SR4 =>
      when pkg_enum.OP_COM =>
      when pkg_enum.OP_LNK =>
      when pkg_enum.OP_INC =>
      when pkg_enum.OP_EDI =>
      when pkg_enum.OP_LIS =>
      when pkg_enum.OP_TST8 =>
      when pkg_enum.OP_TST9 =>
      when pkg_enum.OP_NOP =>
      when others =>
    end case;
  end process;

  process(dst9_v_3,io_op,io_src1)
  begin
    dst9_v_4 <= dst9_v_3;
    case io_op is
      when pkg_enum.OP_ADD =>
      when pkg_enum.OP_ADDD =>
      when pkg_enum.OP_CMP =>
      when pkg_enum.OP_AND =>
      when pkg_enum.OP_OR =>
      when pkg_enum.OP_XOR =>
      when pkg_enum.OP_DEC =>
        dst9_v_4 <= (unsigned(pkg_cat(std_logic_vector(pkg_unsigned("0")),std_logic_vector(io_src1))) + pkg_unsigned("011111111"));
      when pkg_enum.OP_SL1 =>
      when pkg_enum.OP_SL4 =>
      when pkg_enum.OP_SR1 =>
      when pkg_enum.OP_SR4 =>
      when pkg_enum.OP_COM =>
      when pkg_enum.OP_LNK =>
      when pkg_enum.OP_INC =>
      when pkg_enum.OP_EDI =>
      when pkg_enum.OP_LIS =>
      when pkg_enum.OP_TST8 =>
      when pkg_enum.OP_TST9 =>
      when pkg_enum.OP_NOP =>
      when others =>
    end case;
  end process;

  process(dst_v_7,io_op,io_src1,io_src2)
  begin
    dst_v_8 <= dst_v_7;
    case io_op is
      when pkg_enum.OP_ADD =>
      when pkg_enum.OP_ADDD =>
      when pkg_enum.OP_CMP =>
      when pkg_enum.OP_AND =>
      when pkg_enum.OP_OR =>
      when pkg_enum.OP_XOR =>
        dst_v_8 <= (io_src1 xor io_src2);
      when pkg_enum.OP_DEC =>
      when pkg_enum.OP_SL1 =>
      when pkg_enum.OP_SL4 =>
      when pkg_enum.OP_SR1 =>
      when pkg_enum.OP_SR4 =>
      when pkg_enum.OP_COM =>
      when pkg_enum.OP_LNK =>
      when pkg_enum.OP_INC =>
      when pkg_enum.OP_EDI =>
      when pkg_enum.OP_LIS =>
      when pkg_enum.OP_TST8 =>
      when pkg_enum.OP_TST9 =>
      when pkg_enum.OP_NOP =>
      when others =>
    end case;
  end process;

  process(dst_v_6,io_op,io_src1,io_src2)
  begin
    dst_v_7 <= dst_v_6;
    case io_op is
      when pkg_enum.OP_ADD =>
      when pkg_enum.OP_ADDD =>
      when pkg_enum.OP_CMP =>
      when pkg_enum.OP_AND =>
      when pkg_enum.OP_OR =>
        dst_v_7 <= (io_src1 or io_src2);
      when pkg_enum.OP_XOR =>
      when pkg_enum.OP_DEC =>
      when pkg_enum.OP_SL1 =>
      when pkg_enum.OP_SL4 =>
      when pkg_enum.OP_SR1 =>
      when pkg_enum.OP_SR4 =>
      when pkg_enum.OP_COM =>
      when pkg_enum.OP_LNK =>
      when pkg_enum.OP_INC =>
      when pkg_enum.OP_EDI =>
      when pkg_enum.OP_LIS =>
      when pkg_enum.OP_TST8 =>
      when pkg_enum.OP_TST9 =>
      when pkg_enum.OP_NOP =>
      when others =>
    end case;
  end process;

  process(dst_v_5,io_op,io_src1,io_src2)
  begin
    dst_v_6 <= dst_v_5;
    case io_op is
      when pkg_enum.OP_ADD =>
      when pkg_enum.OP_ADDD =>
      when pkg_enum.OP_CMP =>
      when pkg_enum.OP_AND =>
        dst_v_6 <= (io_src1 and io_src2);
      when pkg_enum.OP_OR =>
      when pkg_enum.OP_XOR =>
      when pkg_enum.OP_DEC =>
      when pkg_enum.OP_SL1 =>
      when pkg_enum.OP_SL4 =>
      when pkg_enum.OP_SR1 =>
      when pkg_enum.OP_SR4 =>
      when pkg_enum.OP_COM =>
      when pkg_enum.OP_LNK =>
      when pkg_enum.OP_INC =>
      when pkg_enum.OP_EDI =>
      when pkg_enum.OP_LIS =>
      when pkg_enum.OP_TST8 =>
      when pkg_enum.OP_TST9 =>
      when pkg_enum.OP_NOP =>
      when others =>
    end case;
  end process;

  process(dst9_v_2,io_op,io_src1,io_src2)
  begin
    dst9_v_3 <= dst9_v_2;
    case io_op is
      when pkg_enum.OP_ADD =>
      when pkg_enum.OP_ADDD =>
      when pkg_enum.OP_CMP =>
        dst9_v_3 <= ((unsigned(pkg_cat(std_logic_vector(pkg_unsigned("0")),std_logic_vector(pkg_not(io_src1)))) + unsigned(pkg_cat(std_logic_vector(pkg_unsigned("0")),std_logic_vector(io_src2)))) + pkg_unsigned("000000001"));
      when pkg_enum.OP_AND =>
      when pkg_enum.OP_OR =>
      when pkg_enum.OP_XOR =>
      when pkg_enum.OP_DEC =>
      when pkg_enum.OP_SL1 =>
      when pkg_enum.OP_SL4 =>
      when pkg_enum.OP_SR1 =>
      when pkg_enum.OP_SR4 =>
      when pkg_enum.OP_COM =>
      when pkg_enum.OP_LNK =>
      when pkg_enum.OP_INC =>
      when pkg_enum.OP_EDI =>
      when pkg_enum.OP_LIS =>
      when pkg_enum.OP_TST8 =>
      when pkg_enum.OP_TST9 =>
      when pkg_enum.OP_NOP =>
      when others =>
    end case;
  end process;

  process(dst_v_4,io_op,zz_3,zz_4,tc_v_1,tic_v_1)
  begin
    dst_v_5 <= dst_v_4;
    case io_op is
      when pkg_enum.OP_ADD =>
      when pkg_enum.OP_ADDD =>
        if zz_3 = '0' then
          if zz_4 = '0' then
            if (tc_v_1 and (not tic_v_1)) = '1' then
              dst_v_5 <= ((dst_v_4 and pkg_unsigned("11110000")) + ((dst_v_4 + pkg_unsigned("00001010")) and pkg_unsigned("00001111")));
            end if;
          end if;
        end if;
      when pkg_enum.OP_CMP =>
      when pkg_enum.OP_AND =>
      when pkg_enum.OP_OR =>
      when pkg_enum.OP_XOR =>
      when pkg_enum.OP_DEC =>
      when pkg_enum.OP_SL1 =>
      when pkg_enum.OP_SL4 =>
      when pkg_enum.OP_SR1 =>
      when pkg_enum.OP_SR4 =>
      when pkg_enum.OP_COM =>
      when pkg_enum.OP_LNK =>
      when pkg_enum.OP_INC =>
      when pkg_enum.OP_EDI =>
      when pkg_enum.OP_LIS =>
      when pkg_enum.OP_TST8 =>
      when pkg_enum.OP_TST9 =>
      when pkg_enum.OP_NOP =>
      when others =>
    end case;
  end process;

  process(dst_v_3,io_op,zz_3,zz_4)
  begin
    dst_v_4 <= dst_v_3;
    case io_op is
      when pkg_enum.OP_ADD =>
      when pkg_enum.OP_ADDD =>
        if zz_3 = '0' then
          if zz_4 = '1' then
            dst_v_4 <= (((dst_v_3 + pkg_unsigned("10100000")) and pkg_unsigned("11110000")) + (dst_v_3 and pkg_unsigned("00001111")));
          end if;
        end if;
      when pkg_enum.OP_CMP =>
      when pkg_enum.OP_AND =>
      when pkg_enum.OP_OR =>
      when pkg_enum.OP_XOR =>
      when pkg_enum.OP_DEC =>
      when pkg_enum.OP_SL1 =>
      when pkg_enum.OP_SL4 =>
      when pkg_enum.OP_SR1 =>
      when pkg_enum.OP_SR4 =>
      when pkg_enum.OP_COM =>
      when pkg_enum.OP_LNK =>
      when pkg_enum.OP_INC =>
      when pkg_enum.OP_EDI =>
      when pkg_enum.OP_LIS =>
      when pkg_enum.OP_TST8 =>
      when pkg_enum.OP_TST9 =>
      when pkg_enum.OP_NOP =>
      when others =>
    end case;
  end process;

  process(dst_v_2,io_op,zz_3)
  begin
    dst_v_3 <= dst_v_2;
    case io_op is
      when pkg_enum.OP_ADD =>
      when pkg_enum.OP_ADDD =>
        if zz_3 = '1' then
          dst_v_3 <= (((dst_v_2 + pkg_unsigned("10100000")) and pkg_unsigned("11110000")) + ((dst_v_2 + pkg_unsigned("00001010")) and pkg_unsigned("00001111")));
        end if;
      when pkg_enum.OP_CMP =>
      when pkg_enum.OP_AND =>
      when pkg_enum.OP_OR =>
      when pkg_enum.OP_XOR =>
      when pkg_enum.OP_DEC =>
      when pkg_enum.OP_SL1 =>
      when pkg_enum.OP_SL4 =>
      when pkg_enum.OP_SR1 =>
      when pkg_enum.OP_SR4 =>
      when pkg_enum.OP_COM =>
      when pkg_enum.OP_LNK =>
      when pkg_enum.OP_INC =>
      when pkg_enum.OP_EDI =>
      when pkg_enum.OP_LIS =>
      when pkg_enum.OP_TST8 =>
      when pkg_enum.OP_TST9 =>
      when pkg_enum.OP_NOP =>
      when others =>
    end case;
  end process;

  process(dst_v_1,io_op,io_src1,io_src2)
  begin
    dst_v_2 <= dst_v_1;
    case io_op is
      when pkg_enum.OP_ADD =>
      when pkg_enum.OP_ADDD =>
        dst_v_2 <= (io_src1 + io_src2);
      when pkg_enum.OP_CMP =>
      when pkg_enum.OP_AND =>
      when pkg_enum.OP_OR =>
      when pkg_enum.OP_XOR =>
      when pkg_enum.OP_DEC =>
      when pkg_enum.OP_SL1 =>
      when pkg_enum.OP_SL4 =>
      when pkg_enum.OP_SR1 =>
      when pkg_enum.OP_SR4 =>
      when pkg_enum.OP_COM =>
      when pkg_enum.OP_LNK =>
      when pkg_enum.OP_INC =>
      when pkg_enum.OP_EDI =>
      when pkg_enum.OP_LIS =>
      when pkg_enum.OP_TST8 =>
      when pkg_enum.OP_TST9 =>
      when pkg_enum.OP_NOP =>
      when others =>
    end case;
  end process;

  process(tic_v,io_op,io_src1,io_src2)
  begin
    tic_v_1 <= tic_v;
    case io_op is
      when pkg_enum.OP_ADD =>
      when pkg_enum.OP_ADDD =>
        tic_v_1 <= pkg_toStdLogic(pkg_unsigned("01111") < (unsigned(pkg_cat(std_logic_vector(pkg_unsigned("0")),std_logic_vector(pkg_extract(io_src1,3,0)))) + unsigned(pkg_cat(std_logic_vector(pkg_unsigned("0")),std_logic_vector(pkg_extract(io_src2,3,0))))));
      when pkg_enum.OP_CMP =>
      when pkg_enum.OP_AND =>
      when pkg_enum.OP_OR =>
      when pkg_enum.OP_XOR =>
      when pkg_enum.OP_DEC =>
      when pkg_enum.OP_SL1 =>
      when pkg_enum.OP_SL4 =>
      when pkg_enum.OP_SR1 =>
      when pkg_enum.OP_SR4 =>
      when pkg_enum.OP_COM =>
      when pkg_enum.OP_LNK =>
      when pkg_enum.OP_INC =>
      when pkg_enum.OP_EDI =>
      when pkg_enum.OP_LIS =>
      when pkg_enum.OP_TST8 =>
      when pkg_enum.OP_TST9 =>
      when pkg_enum.OP_NOP =>
      when others =>
    end case;
  end process;

  process(tc_v,io_op,io_src1,io_src2)
  begin
    tc_v_1 <= tc_v;
    case io_op is
      when pkg_enum.OP_ADD =>
      when pkg_enum.OP_ADDD =>
        tc_v_1 <= pkg_toStdLogic(pkg_resize(pkg_unsigned("011110000"),18) < unsigned(pkg_cat(std_logic_vector((unsigned(pkg_cat(std_logic_vector(pkg_unsigned("0")),std_logic_vector(io_src1))) + unsigned(pkg_cat(std_logic_vector(pkg_unsigned("0")),std_logic_vector(io_src2))))),std_logic_vector(pkg_unsigned("111110000")))));
      when pkg_enum.OP_CMP =>
      when pkg_enum.OP_AND =>
      when pkg_enum.OP_OR =>
      when pkg_enum.OP_XOR =>
      when pkg_enum.OP_DEC =>
      when pkg_enum.OP_SL1 =>
      when pkg_enum.OP_SL4 =>
      when pkg_enum.OP_SR1 =>
      when pkg_enum.OP_SR4 =>
      when pkg_enum.OP_COM =>
      when pkg_enum.OP_LNK =>
      when pkg_enum.OP_INC =>
      when pkg_enum.OP_EDI =>
      when pkg_enum.OP_LIS =>
      when pkg_enum.OP_TST8 =>
      when pkg_enum.OP_TST9 =>
      when pkg_enum.OP_NOP =>
      when others =>
    end case;
  end process;

  process(dst9_v_1,io_op,io_src1,io_src2)
  begin
    dst9_v_2 <= dst9_v_1;
    case io_op is
      when pkg_enum.OP_ADD =>
      when pkg_enum.OP_ADDD =>
        dst9_v_2 <= (unsigned(pkg_cat(std_logic_vector(pkg_unsigned("0")),std_logic_vector(io_src1))) + unsigned(pkg_cat(std_logic_vector(pkg_unsigned("0")),std_logic_vector(io_src2))));
      when pkg_enum.OP_CMP =>
      when pkg_enum.OP_AND =>
      when pkg_enum.OP_OR =>
      when pkg_enum.OP_XOR =>
      when pkg_enum.OP_DEC =>
      when pkg_enum.OP_SL1 =>
      when pkg_enum.OP_SL4 =>
      when pkg_enum.OP_SR1 =>
      when pkg_enum.OP_SR4 =>
      when pkg_enum.OP_COM =>
      when pkg_enum.OP_LNK =>
      when pkg_enum.OP_INC =>
      when pkg_enum.OP_EDI =>
      when pkg_enum.OP_LIS =>
      when pkg_enum.OP_TST8 =>
      when pkg_enum.OP_TST9 =>
      when pkg_enum.OP_NOP =>
      when others =>
    end case;
  end process;

  process(dst_v,io_op,dst9_v_1)
  begin
    dst_v_1 <= dst_v;
    case io_op is
      when pkg_enum.OP_ADD =>
        dst_v_1 <= pkg_extract(dst9_v_1,7,0);
      when pkg_enum.OP_ADDD =>
      when pkg_enum.OP_CMP =>
      when pkg_enum.OP_AND =>
      when pkg_enum.OP_OR =>
      when pkg_enum.OP_XOR =>
      when pkg_enum.OP_DEC =>
      when pkg_enum.OP_SL1 =>
      when pkg_enum.OP_SL4 =>
      when pkg_enum.OP_SR1 =>
      when pkg_enum.OP_SR4 =>
      when pkg_enum.OP_COM =>
      when pkg_enum.OP_LNK =>
      when pkg_enum.OP_INC =>
      when pkg_enum.OP_EDI =>
      when pkg_enum.OP_LIS =>
      when pkg_enum.OP_TST8 =>
      when pkg_enum.OP_TST9 =>
      when pkg_enum.OP_NOP =>
      when others =>
    end case;
  end process;

  process(dst9_v,io_op,io_src1,io_src2)
  begin
    dst9_v_1 <= dst9_v;
    case io_op is
      when pkg_enum.OP_ADD =>
        dst9_v_1 <= (unsigned(pkg_cat(std_logic_vector(pkg_unsigned("0")),std_logic_vector(io_src1))) + unsigned(pkg_cat(std_logic_vector(pkg_unsigned("0")),std_logic_vector(io_src2))));
      when pkg_enum.OP_ADDD =>
      when pkg_enum.OP_CMP =>
      when pkg_enum.OP_AND =>
      when pkg_enum.OP_OR =>
      when pkg_enum.OP_XOR =>
      when pkg_enum.OP_DEC =>
      when pkg_enum.OP_SL1 =>
      when pkg_enum.OP_SL4 =>
      when pkg_enum.OP_SR1 =>
      when pkg_enum.OP_SR4 =>
      when pkg_enum.OP_COM =>
      when pkg_enum.OP_LNK =>
      when pkg_enum.OP_INC =>
      when pkg_enum.OP_EDI =>
      when pkg_enum.OP_LIS =>
      when pkg_enum.OP_TST8 =>
      when pkg_enum.OP_TST9 =>
      when pkg_enum.OP_NOP =>
      when others =>
    end case;
  end process;

  tc_v <= pkg_toStdLogic(false);
  tic_v <= pkg_toStdLogic(false);
  dst9_v <= pkg_unsigned("000000000");
  dst_v <= pkg_unsigned("00000000");
  process(io_iozcs_i,io_op,dst9_v_1,io_src1,io_src2,dst9_v_2,dst9_v_3,dst_v_6,dst_v_7,dst_v_8,dst9_v_4,dst_v_10,dst_v_11,dst_v_12,dst_v_13,dst_v_14,dst9_v_5,dst9_v_6,io_code)
  begin
    io_iozcs_o <= io_iozcs_i;
    case io_op is
      when pkg_enum.OP_ADD =>
        io_iozcs_o(0) <= (not pkg_extract(dst9_v_1,7));
        io_iozcs_o(1) <= pkg_extract(dst9_v_1,8);
        io_iozcs_o(2) <= pkg_toStdLogic(pkg_extract(dst9_v_1,7,0) = pkg_unsigned("00000000"));
        io_iozcs_o(3) <= ((pkg_extract(io_src1,7) xor pkg_extract(dst9_v_1,7)) and (pkg_extract(io_src2,7) xor pkg_extract(dst9_v_1,7)));
      when pkg_enum.OP_ADDD =>
        io_iozcs_o(0) <= (not pkg_extract(dst9_v_2,7));
        io_iozcs_o(1) <= pkg_extract(dst9_v_2,8);
        io_iozcs_o(2) <= pkg_toStdLogic(pkg_extract(dst9_v_2,7,0) = pkg_unsigned("00000000"));
        io_iozcs_o(3) <= ((pkg_extract(io_src1,7) xor pkg_extract(dst9_v_2,7)) and (pkg_extract(io_src2,7) xor pkg_extract(dst9_v_2,7)));
      when pkg_enum.OP_CMP =>
        io_iozcs_o(0) <= (not pkg_extract(dst9_v_3,7));
        io_iozcs_o(1) <= pkg_extract(dst9_v_3,8);
        io_iozcs_o(2) <= pkg_toStdLogic(pkg_extract(dst9_v_3,7,0) = pkg_unsigned("00000000"));
        io_iozcs_o(3) <= (((not pkg_extract(io_src1,7)) xor pkg_extract(dst9_v_3,7)) and (pkg_extract(io_src2,7) xor pkg_extract(dst9_v_3,7)));
      when pkg_enum.OP_AND =>
        io_iozcs_o(0) <= (not pkg_extract(dst_v_6,7));
        io_iozcs_o(1) <= pkg_toStdLogic(false);
        io_iozcs_o(2) <= pkg_toStdLogic(dst_v_6 = pkg_unsigned("00000000"));
        io_iozcs_o(3) <= pkg_toStdLogic(false);
      when pkg_enum.OP_OR =>
        io_iozcs_o(0) <= (not pkg_extract(dst_v_7,7));
        io_iozcs_o(1) <= pkg_toStdLogic(false);
        io_iozcs_o(2) <= pkg_toStdLogic(dst_v_7 = pkg_unsigned("00000000"));
        io_iozcs_o(3) <= pkg_toStdLogic(false);
      when pkg_enum.OP_XOR =>
        io_iozcs_o(0) <= (not pkg_extract(dst_v_8,7));
        io_iozcs_o(1) <= pkg_toStdLogic(false);
        io_iozcs_o(2) <= pkg_toStdLogic(dst_v_8 = pkg_unsigned("00000000"));
        io_iozcs_o(3) <= pkg_toStdLogic(false);
      when pkg_enum.OP_DEC =>
        io_iozcs_o(0) <= (not pkg_extract(dst9_v_4,7));
        io_iozcs_o(1) <= pkg_extract(dst9_v_4,8);
        io_iozcs_o(2) <= pkg_toStdLogic(pkg_extract(dst9_v_4,7,0) = pkg_unsigned("00000000"));
        io_iozcs_o(3) <= ((pkg_extract(io_src1,7) xor pkg_extract(dst9_v_4,7)) and (not pkg_extract(dst9_v_4,7)));
      when pkg_enum.OP_SL1 =>
        io_iozcs_o(0) <= (not pkg_extract(dst_v_10,7));
        io_iozcs_o(1) <= pkg_toStdLogic(false);
        io_iozcs_o(2) <= pkg_toStdLogic(dst_v_10 = pkg_unsigned("00000000"));
        io_iozcs_o(3) <= pkg_toStdLogic(false);
      when pkg_enum.OP_SL4 =>
        io_iozcs_o(0) <= (not pkg_extract(dst_v_11,7));
        io_iozcs_o(1) <= pkg_toStdLogic(false);
        io_iozcs_o(2) <= pkg_toStdLogic(dst_v_11 = pkg_unsigned("00000000"));
        io_iozcs_o(3) <= pkg_toStdLogic(false);
      when pkg_enum.OP_SR1 =>
        io_iozcs_o(0) <= (not pkg_extract(dst_v_12,7));
        io_iozcs_o(1) <= pkg_toStdLogic(false);
        io_iozcs_o(2) <= pkg_toStdLogic(dst_v_12 = pkg_unsigned("00000000"));
        io_iozcs_o(3) <= pkg_toStdLogic(false);
      when pkg_enum.OP_SR4 =>
        io_iozcs_o(0) <= (not pkg_extract(dst_v_13,7));
        io_iozcs_o(1) <= pkg_toStdLogic(false);
        io_iozcs_o(2) <= pkg_toStdLogic(dst_v_13 = pkg_unsigned("00000000"));
        io_iozcs_o(3) <= pkg_toStdLogic(false);
      when pkg_enum.OP_COM =>
        io_iozcs_o(0) <= (not pkg_extract(dst_v_14,7));
        io_iozcs_o(1) <= pkg_toStdLogic(false);
        io_iozcs_o(2) <= pkg_toStdLogic(dst_v_14 = pkg_unsigned("00000000"));
        io_iozcs_o(3) <= pkg_toStdLogic(false);
      when pkg_enum.OP_LNK =>
        io_iozcs_o(0) <= (not pkg_extract(dst9_v_5,7));
        io_iozcs_o(1) <= pkg_extract(dst9_v_5,8);
        io_iozcs_o(2) <= pkg_toStdLogic(pkg_extract(dst9_v_5,7,0) = pkg_unsigned("00000000"));
        io_iozcs_o(3) <= ((pkg_extract(io_src1,7) xor pkg_extract(dst9_v_5,7)) and pkg_extract(dst9_v_5,7));
      when pkg_enum.OP_INC =>
        io_iozcs_o(0) <= (not pkg_extract(dst9_v_6,7));
        io_iozcs_o(1) <= pkg_extract(dst9_v_6,8);
        io_iozcs_o(2) <= pkg_toStdLogic(pkg_extract(dst9_v_6,7,0) = pkg_unsigned("00000000"));
        io_iozcs_o(3) <= ((pkg_extract(io_src1,7) xor pkg_extract(dst9_v_6,7)) and pkg_extract(dst9_v_6,7));
      when pkg_enum.OP_EDI =>
        io_iozcs_o(4) <= pkg_extract(io_code,0);
      when pkg_enum.OP_LIS =>
      when pkg_enum.OP_TST8 =>
      when pkg_enum.OP_TST9 =>
      when pkg_enum.OP_NOP =>
      when others =>
    end case;
  end process;

  process(io_op)
  begin
    io_dstm <= pkg_toStdLogic(false);
    case io_op is
      when pkg_enum.OP_ADD =>
        io_dstm <= pkg_toStdLogic(true);
      when pkg_enum.OP_ADDD =>
        io_dstm <= pkg_toStdLogic(true);
      when pkg_enum.OP_CMP =>
        io_dstm <= pkg_toStdLogic(false);
      when pkg_enum.OP_AND =>
        io_dstm <= pkg_toStdLogic(true);
      when pkg_enum.OP_OR =>
        io_dstm <= pkg_toStdLogic(true);
      when pkg_enum.OP_XOR =>
        io_dstm <= pkg_toStdLogic(true);
      when pkg_enum.OP_DEC =>
        io_dstm <= pkg_toStdLogic(true);
      when pkg_enum.OP_SL1 =>
        io_dstm <= pkg_toStdLogic(true);
      when pkg_enum.OP_SL4 =>
        io_dstm <= pkg_toStdLogic(true);
      when pkg_enum.OP_SR1 =>
        io_dstm <= pkg_toStdLogic(true);
      when pkg_enum.OP_SR4 =>
        io_dstm <= pkg_toStdLogic(true);
      when pkg_enum.OP_COM =>
        io_dstm <= pkg_toStdLogic(true);
      when pkg_enum.OP_LNK =>
        io_dstm <= pkg_toStdLogic(true);
      when pkg_enum.OP_INC =>
        io_dstm <= pkg_toStdLogic(true);
      when pkg_enum.OP_EDI =>
      when pkg_enum.OP_LIS =>
        io_dstm <= pkg_toStdLogic(true);
      when pkg_enum.OP_TST8 =>
      when pkg_enum.OP_TST9 =>
        io_dstm <= pkg_toStdLogic(false);
      when pkg_enum.OP_NOP =>
        io_dstm <= pkg_toStdLogic(false);
      when others =>
        io_dstm <= pkg_toStdLogic(true);
    end case;
  end process;

  process(io_op,zz_1,zz_2)
  begin
    io_test <= pkg_toStdLogic(false);
    case io_op is
      when pkg_enum.OP_ADD =>
      when pkg_enum.OP_ADDD =>
      when pkg_enum.OP_CMP =>
      when pkg_enum.OP_AND =>
      when pkg_enum.OP_OR =>
      when pkg_enum.OP_XOR =>
      when pkg_enum.OP_DEC =>
      when pkg_enum.OP_SL1 =>
      when pkg_enum.OP_SL4 =>
      when pkg_enum.OP_SR1 =>
      when pkg_enum.OP_SR4 =>
      when pkg_enum.OP_COM =>
      when pkg_enum.OP_LNK =>
      when pkg_enum.OP_INC =>
      when pkg_enum.OP_EDI =>
      when pkg_enum.OP_LIS =>
      when pkg_enum.OP_TST8 =>
        io_test <= zz_1;
      when pkg_enum.OP_TST9 =>
        io_test <= zz_2;
      when pkg_enum.OP_NOP =>
      when others =>
    end case;
  end process;

  process(zz_5,io_iozcs_i)
  begin
    case zz_5 is
      when "000" =>
        zz_1 <= pkg_toStdLogic(false);
      when "001" =>
        zz_1 <= pkg_extract(io_iozcs_i,0);
      when "010" =>
        zz_1 <= pkg_extract(io_iozcs_i,1);
      when "011" =>
        zz_1 <= (pkg_extract(io_iozcs_i,0) or pkg_extract(io_iozcs_i,1));
      when "100" =>
        zz_1 <= pkg_extract(io_iozcs_i,2);
      when "101" =>
        zz_1 <= pkg_extract(io_iozcs_i,0);
      when "110" =>
        zz_1 <= (pkg_extract(io_iozcs_i,2) or pkg_extract(io_iozcs_i,1));
      when others =>
        zz_1 <= (pkg_extract(io_iozcs_i,0) or pkg_extract(io_iozcs_i,1));
    end case;
  end process;

  process(zz_6,io_iozcs_i)
  begin
    case zz_6 is
      when "0000" =>
        zz_2 <= pkg_toStdLogic(true);
      when "0001" =>
        zz_2 <= (not pkg_extract(io_iozcs_i,0));
      when "0010" =>
        zz_2 <= (not pkg_extract(io_iozcs_i,1));
      when "0011" =>
        zz_2 <= ((not pkg_extract(io_iozcs_i,1)) and (not pkg_extract(io_iozcs_i,0)));
      when "0100" =>
        zz_2 <= (not pkg_extract(io_iozcs_i,2));
      when "0101" =>
        zz_2 <= (not pkg_extract(io_iozcs_i,0));
      when "0110" =>
        zz_2 <= ((not pkg_extract(io_iozcs_i,1)) and (not pkg_extract(io_iozcs_i,2)));
      when "0111" =>
        zz_2 <= ((not pkg_extract(io_iozcs_i,1)) and (not pkg_extract(io_iozcs_i,0)));
      when "1000" =>
        zz_2 <= (not pkg_extract(io_iozcs_i,3));
      when "1001" =>
        zz_2 <= ((not pkg_extract(io_iozcs_i,3)) and (not pkg_extract(io_iozcs_i,0)));
      when "1010" =>
        zz_2 <= ((not pkg_extract(io_iozcs_i,3)) and (not pkg_extract(io_iozcs_i,1)));
      when "1011" =>
        zz_2 <= (((not pkg_extract(io_iozcs_i,3)) and (not pkg_extract(io_iozcs_i,1))) and (not pkg_extract(io_iozcs_i,0)));
      when "1100" =>
        zz_2 <= ((not pkg_extract(io_iozcs_i,3)) and (not pkg_extract(io_iozcs_i,2)));
      when "1101" =>
        zz_2 <= ((not pkg_extract(io_iozcs_i,3)) and (not pkg_extract(io_iozcs_i,0)));
      when "1110" =>
        zz_2 <= (((not pkg_extract(io_iozcs_i,3)) and (not pkg_extract(io_iozcs_i,1))) and (not pkg_extract(io_iozcs_i,0)));
      when others =>
        zz_2 <= (((not pkg_extract(io_iozcs_i,3)) and (not pkg_extract(io_iozcs_i,1))) and (not pkg_extract(io_iozcs_i,0)));
    end case;
  end process;

  io_dst <= dst_v_18;
end arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity f8_cpu is
  port(
    io_dr : in unsigned(7 downto 0);
    io_dw : out unsigned(7 downto 0);
    io_dv : out std_logic;
    io_romc : out unsigned(4 downto 0);
    io_phase : out unsigned(3 downto 0);
    io_po_a : out unsigned(7 downto 0);
    io_pi_a : in unsigned(7 downto 0);
    io_po_b : out unsigned(7 downto 0);
    io_pi_b : in unsigned(7 downto 0);
    io_ce : in std_logic;
    io_acco : out unsigned(7 downto 0);
    io_visaro : out unsigned(5 downto 0);
    io_iozcso : out unsigned(4 downto 0);
    io_reset_na : in std_logic;
    clk : in std_logic;
    reset : in std_logic
  );
end f8_cpu;

architecture arch of f8_cpu is
  signal zz_22 : std_logic_vector(7 downto 0);
  signal zz_23 : std_logic_vector(23 downto 0);
  signal aluop_1_io_dst : unsigned(7 downto 0);
  signal aluop_1_io_dstm : std_logic;
  signal aluop_1_io_iozcs_o : unsigned(4 downto 0);
  signal aluop_1_io_test : std_logic;
  signal zz_24 : std_logic;
  signal zz_25 : std_logic_vector(7 downto 0);

  signal madrs : unsigned(10 downto 0);
  signal opcode : unsigned(7 downto 0);
  signal mop_romc : unsigned(4 downto 0);
  signal mop_len : EnumLen;
  signal mop_last : std_logic;
  signal mop_int : EnumInt;
  signal mop_op : EnumOp;
  signal mop_rd : unsigned(4 downto 0);
  signal mop_rs : unsigned(4 downto 0);
  signal acc : unsigned(7 downto 0);
  signal visar : unsigned(5 downto 0);
  signal visarl : unsigned(2 downto 0);
  signal rs : unsigned(5 downto 0);
  signal rd : unsigned(5 downto 0);
  signal sreg_wa : unsigned(5 downto 0);
  signal sreg_wd : unsigned(7 downto 0);
  signal sreg_wr : std_logic;
  signal sreg_ra : unsigned(5 downto 0);
  signal sreg_rd : unsigned(7 downto 0);
  signal iozcs : unsigned(4 downto 0);
  signal alu : unsigned(7 downto 0);
  signal dstm : std_logic;
  signal test : std_logic;
  signal testp : std_logic;
  signal bcc : std_logic;
  signal bccp : std_logic;
  signal poa_l : unsigned(7 downto 0);
  signal pob_l : unsigned(7 downto 0);
  signal phase_l : unsigned(3 downto 0);
  signal dw : unsigned(7 downto 0);
  signal dv : std_logic;
  signal iozcs_v : unsigned(4 downto 0);
  signal len_v : EnumLen;
  signal zz_1 : EnumLen;
  signal zz_2 : EnumInt;
  signal zz_3 : EnumOp;
  signal zz_4 : std_logic_vector(23 downto 0);
  signal zz_5 : EnumLen;
  signal zz_6 : EnumInt;
  signal zz_7 : EnumOp;
  signal zz_8 : unsigned(7 downto 0);
  signal zz_9 : unsigned(7 downto 0);
  signal zz_10 : unsigned(7 downto 0);
  signal zz_11 : unsigned(7 downto 0);
  signal zz_12 : unsigned(7 downto 0);
  signal zz_13 : unsigned(7 downto 0);
  signal zz_14 : unsigned(7 downto 0);
  signal zz_15 : unsigned(7 downto 0);
  signal zz_16 : unsigned(7 downto 0);
  signal zz_17 : unsigned(7 downto 0);
  signal zz_18 : unsigned(7 downto 0);
  signal zz_19 : unsigned(7 downto 0);
  signal zz_20 : unsigned(7 downto 0);
  signal zz_21 : unsigned(7 downto 0);
  type scratch_regs_type is array (0 to 63) of std_logic_vector(7 downto 0);
  signal scratch_regs : scratch_regs_type;
  type Micro_type is array (0 to 2047) of std_logic_vector(23 downto 0);
  signal Micro : Micro_type := (
     "011001000000001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","011011000000001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "011101000000001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","011111000000001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "100000110000001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100000110100001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "100000111000001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100000111100001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "111110110000001000100111","111110110100001000101011","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","011001111100001000110101","011011111100001000111000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "101001000000001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001010000001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "011011111100001000110010","011001111100001000110100","100001000000000011000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","011111111100001000110111","011101111100001000110100","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "111110111000001000100110","111110111100001000101001","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","011101111100001000110110","011111111100001000111001","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "010101111100001000110110","010111111100001000111001","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","111110101000001000100110","111110101100001000101001","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "100001000001000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000001001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "100001000001010001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000001011001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "111111000000001000100010","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001111100001000100101","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "100001000001100001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000001101001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "100001000001110100011100","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000001110000011100","100001000000000011000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "100001000000000000000100","100001000000000011000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","010011000100001000011100","100001000000000011000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "100010100100001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000001111001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "111111000000001000100011","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","111111000000100000100011","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "111111000000101000100011","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","111111000000110000100011","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "111111000000010000100011","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","111111000000111000100011","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "100001000000000000100011","111111000000001000111011","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000000100011","100001111100001000111010","100001000000000011000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "111111000000001000100011","100001000000000000001101","111111111100001000101100","100001111100001000110100","100001000000000011000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","111111000000001000100011","111111111100001000101100","100001111100001000110100","100001000000000011000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "111111111100001000110001","100001000000000000000011","111111111100001000101110","100001000000000000000011","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "100001000000000001011101","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "100001000000000000111100","100001000000000000101111","100001000000000100110011","100001000000000011000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000000011100","100001000000000100101000","100001000000000011000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "000000000010000001100000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","000010000110000001100000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "000100001010000001100000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","000110001110000001100000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "001000010010000001100000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","001010010110000001100000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "001100011010000001100000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","001110011110000001100000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "010000100010000001100000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","010010100110000001100000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "010100101010000001100000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","010110101110000001100000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "101011010110000001100000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","101101011010000001100000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "101111011110000001100000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","011110111110000001100000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "000001000000001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","000011000000001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "000101000000001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","000111000000001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "001001000000001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","001011000000001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "001101000000001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","001111000000001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "010001000000001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","010011000000001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "010101000000001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","010111000000001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "101011000000001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","101101000000001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "101111000000001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","011111000000001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "100000000000001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100000000100001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "100000001000001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100000001100001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "100000010000001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100000010100001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "100000011000001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100000011100001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "100000100000001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100000100100001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "100000101000001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100000101100001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "100001010100001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001011000001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "100001011100001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100000111100001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "000001001010001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","000011001010001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "000101001010001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","000111001010001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "001001001010001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","001011001010001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "001101001010001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","001111001010001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "000001001110001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","000011001110001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "000101001110001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","000111001110001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "001001001110001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","001011001110001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "001101001110001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","001111001110001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "100001000010001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000010001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "100001000010001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000010001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "100001000010001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000010001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "100001000010001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000010001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "100001000010001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000010001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "100001000010001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000010001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "100001000010001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000010001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "100001000010001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000010001001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "100001000010010000011100","100001000000000000000011","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000010010000011100","100001000000000000000011","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "100001000010010000011100","100001000000000000000011","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000010010000011100","100001000000000000000011","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "100001000010010000011100","100001000000000000000011","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000010010000011100","100001000000000000000011","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "100001000010010000011100","100001000000000000000011","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000010010000011100","100001000000000000000011","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "111111000000010000100010","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","111111000000011000100010","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "111111000000100000100010","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","111111000000101000100010","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "111111000000110000100010","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","111111000000111000100010","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "100001111100001000101010","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000000000011","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "100001000010011000011100","100001000000000000000011","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000010011000011100","100001000000000000000011","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "100001000010011000011100","100001000000000000000011","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000010011000011100","100001000000000000000011","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "100001000010011000011100","100001000000000000000011","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000010011000011100","100001000000000000000011","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "100001000010011000011100","100001000000000000000011","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000010011000011100","100001000000000000000011","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "100001000010011000011100","100001000000000000000011","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000010011000011100","100001000000000000000011","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "100001000010011000011100","100001000000000000000011","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000010011000011100","100001000000000000000011","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "100001000010011000011100","100001000000000000000011","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000010011000011100","100001000000000000000011","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "100001000010011000011100","100001000000000000000011","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000010011000011100","100001000000000000000011","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "110001000000001000011100","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","110011000000001000011100","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "000101111110001000111100","111111000000001000111011","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","000111111110001000111100","111111000000001000111011","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "001001111110001000111100","111111000000001000111011","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","001011111110001000111100","111111000000001000111011","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "001101111110001000111100","111111000000001000111011","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","001111111110001000111100","111111000000001000111011","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "010001111110001000111100","111111000000001000111011","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","010011111110001000111100","111111000000001000111011","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "010101111110001000111100","111111000000001000111011","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","010111111110001000111100","111111000000001000111011","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "011001111110001000111100","111111000000001000111011","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","011011111110001000111100","111111000000001000111011","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "011101111110001000111100","111111000000001000111011","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","011111111110001000111100","111111000000001000111011","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "100001100000001000011100","100001000000000000000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001100100001000011100","100001000000000000000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "000101111110001000111100","100001111100001000111010","100001000000000011000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","000111111110001000111100","100001111100001000111010","100001000000000011000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "001001111110001000111100","100001111100001000111010","100001000000000011000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","001011111110001000111100","100001111100001000111010","100001000000000011000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "001101111110001000111100","100001111100001000111010","100001000000000011000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","001111111110001000111100","100001111100001000111010","100001000000000011000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "010001111110001000111100","100001111100001000111010","100001000000000011000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","010011111110001000111100","100001111100001000111010","100001000000000011000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "010101111110001000111100","100001111100001000111010","100001000000000011000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","010111111110001000111100","100001111100001000111010","100001000000000011000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "011001111110001000111100","100001111100001000111010","100001000000000011000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","011011111110001000111100","100001111100001000111010","100001000000000011000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "011101111110001000111100","100001111100001000111010","100001000000000011000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","011111111110001000111100","100001111100001000111010","100001000000000011000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "000001000000010001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","000011000000010001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "000101000000010001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","000111000000010001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "001001000000010001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","001011000000010001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "001101000000010001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","001111000000010001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "010001000000010001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","010011000000010001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "010101000000010001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","010111000000010001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "101011000000010001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","101101000000010001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "101111000000010001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","011111000000010001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "100001000000000000011100","000001000000011001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000000011100","000011000000011001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "100001000000000000011100","000101000000011001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000000011100","000111000000011001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "100001000000000000011100","001001000000011001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000000011100","001011000000011001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "100001000000000000011100","001101000000011001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000000011100","001111000000011001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "100001000000000000011100","010001000000011001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000000011100","010011000000011001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "100001000000000000011100","010101000000011001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000000011100","010111000000011001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "100001000000000000011100","101011000000011001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000000011100","101101000000011001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "100001000000000000011100","101111000000011001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000000011100","011111000000011001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "000001000000110001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","000011000000110001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "000101000000110001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","000111000000110001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "001001000000110001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","001011000000110001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "001101000000110001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","001111000000110001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "010001000000110001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","010011000000110001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "010101000000110001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","010111000000110001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "101011000000110001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","101101000000110001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "101111000000110001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","011111000000110001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "000001000000100001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","000011000000100001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "000101000000100001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","000111000000100001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "001001000000100001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","001011000000100001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "001101000000100001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","001111000000100001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "010001000000100001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","010011000000100001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "010101000000100001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","010111000000100001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "101011000000100001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","101101000000100001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000",
     "101111000000100001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","011111000000100001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000","100001000000000001000000");
begin
  zz_24 <= pkg_toStdLogic(true);
  zz_25 <= std_logic_vector(sreg_wd);
  process(clk)
  begin
    if rising_edge(clk) then
      if zz_24 = '1' then
        zz_22 <= scratch_regs(to_integer(sreg_ra));
      end if;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      if sreg_wr = '1' then
        scratch_regs(to_integer(sreg_wa)) <= zz_25;
      end if;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      if io_ce = '1' then
        zz_23 <= Micro(to_integer(madrs));
      end if;
    end if;
  end process;

  aluop_1 : entity work.aluop
    port map ( 
      io_op => mop_op,
      io_code => opcode,
      io_src1 => zz_17,
      io_src2 => zz_8,
      io_iozcs_i => iozcs,
      io_dst => aluop_1_io_dst,
      io_dstm => aluop_1_io_dstm,
      io_iozcs_o => aluop_1_io_iozcs_o,
      io_test => aluop_1_io_test 
    );
  io_po_a <= poa_l;
  io_po_b <= pob_l;
  io_phase <= phase_l;
  io_dw <= dw;
  io_dv <= dv;
  visarl <= pkg_extract(visar,2,0);
  process(bcc,test,opcode,visarl,mop_romc)
  begin
    if ((bcc and test) or ((pkg_toStdLogic(opcode = pkg_unsigned("10001111")) and pkg_toStdLogic(visarl /= pkg_unsigned("111"))) and pkg_toStdLogic(mop_romc = pkg_unsigned("00011")))) = '1' then
      io_romc <= pkg_unsigned("00001");
    else
      if ((bcc and (not test)) or ((pkg_toStdLogic(opcode = pkg_unsigned("10001111")) and pkg_toStdLogic(visarl = pkg_unsigned("111"))) and pkg_toStdLogic(mop_romc = pkg_unsigned("00011")))) = '1' then
        io_romc <= pkg_unsigned("00011");
      else
        io_romc <= mop_romc;
      end if;
    end if;
  end process;

  process(mop_rs,mop_rd,visar)
  begin
    if pkg_toStdLogic(mop_rs < pkg_unsigned("10000")) = '1' then
      sreg_ra <= pkg_resize(mop_rs,6);
    else
      if pkg_toStdLogic(mop_rd < pkg_unsigned("10000")) = '1' then
        sreg_ra <= pkg_resize(mop_rd,6);
      else
        sreg_ra <= visar;
      end if;
    end if;
  end process;

  sreg_rd <= unsigned(zz_22);
  zz_4 <= zz_23;
  zz_5 <= pkg_toEnumLen_defaultEncoding(pkg_extract(zz_4,5,5));
  zz_1 <= zz_5;
  zz_6 <= pkg_toEnumInt_defaultEncoding(pkg_extract(zz_4,8,7));
  zz_2 <= zz_6;
  zz_7 <= pkg_toEnumOp_defaultEncoding(pkg_extract(zz_4,13,9));
  zz_3 <= zz_7;
  mop_romc <= unsigned(pkg_extract(zz_4,4,0));
  mop_len <= zz_1;
  mop_last <= pkg_extract(pkg_extract(zz_4,6,6),0);
  mop_int <= zz_2;
  mop_op <= zz_3;
  mop_rd <= unsigned(pkg_extract(zz_4,18,14));
  mop_rs <= unsigned(pkg_extract(zz_4,23,19));
  process(zz_9,phase_l,mop_rs,acc)
  begin
    zz_8 <= zz_9;
    case phase_l is
      when "0000" =>
      when "0001" =>
      when "0010" =>
      when "0011" =>
        case mop_rs is
          when "11000" =>
          when "11001" =>
          when "10000" =>
          when "00000" | "00001" | "00010" | "00011" | "00100" | "00101" | "00110" | "00111" | "01000" | "01001" | "01010" | "01011" | "01100" | "01101" | "01110" | "01111" =>
          when "10101" | "10110" | "10111" =>
          when "10001" =>
          when "10100" =>
          when "11111" =>
          when others =>
            zz_8 <= acc;
        end case;
      when "0100" =>
      when "0101" =>
      when "0111" =>
      when "1011" =>
      when others =>
    end case;
  end process;

  process(zz_10,phase_l,mop_rs,io_dr)
  begin
    zz_9 <= zz_10;
    case phase_l is
      when "0000" =>
      when "0001" =>
      when "0010" =>
      when "0011" =>
        case mop_rs is
          when "11000" =>
          when "11001" =>
          when "10000" =>
          when "00000" | "00001" | "00010" | "00011" | "00100" | "00101" | "00110" | "00111" | "01000" | "01001" | "01010" | "01011" | "01100" | "01101" | "01110" | "01111" =>
          when "10101" | "10110" | "10111" =>
          when "10001" =>
          when "10100" =>
          when "11111" =>
            zz_9 <= io_dr;
          when others =>
        end case;
      when "0100" =>
      when "0101" =>
      when "0111" =>
      when "1011" =>
      when others =>
    end case;
  end process;

  process(zz_11,phase_l,mop_rs,visar)
  begin
    zz_10 <= zz_11;
    case phase_l is
      when "0000" =>
      when "0001" =>
      when "0010" =>
      when "0011" =>
        case mop_rs is
          when "11000" =>
          when "11001" =>
          when "10000" =>
          when "00000" | "00001" | "00010" | "00011" | "00100" | "00101" | "00110" | "00111" | "01000" | "01001" | "01010" | "01011" | "01100" | "01101" | "01110" | "01111" =>
          when "10101" | "10110" | "10111" =>
          when "10001" =>
          when "10100" =>
            zz_10 <= pkg_resize(visar,8);
          when "11111" =>
          when others =>
        end case;
      when "0100" =>
      when "0101" =>
      when "0111" =>
      when "1011" =>
      when others =>
    end case;
  end process;

  process(zz_12,phase_l,mop_rs,iozcs)
  begin
    zz_11 <= zz_12;
    case phase_l is
      when "0000" =>
      when "0001" =>
      when "0010" =>
      when "0011" =>
        case mop_rs is
          when "11000" =>
          when "11001" =>
          when "10000" =>
          when "00000" | "00001" | "00010" | "00011" | "00100" | "00101" | "00110" | "00111" | "01000" | "01001" | "01010" | "01011" | "01100" | "01101" | "01110" | "01111" =>
          when "10101" | "10110" | "10111" =>
          when "10001" =>
            zz_11 <= pkg_resize(iozcs,8);
          when "10100" =>
          when "11111" =>
          when others =>
        end case;
      when "0100" =>
      when "0101" =>
      when "0111" =>
      when "1011" =>
      when others =>
    end case;
  end process;

  process(zz_13,phase_l,mop_rs,sreg_rd)
  begin
    zz_12 <= zz_13;
    case phase_l is
      when "0000" =>
      when "0001" =>
      when "0010" =>
      when "0011" =>
        case mop_rs is
          when "11000" =>
          when "11001" =>
          when "10000" =>
          when "00000" | "00001" | "00010" | "00011" | "00100" | "00101" | "00110" | "00111" | "01000" | "01001" | "01010" | "01011" | "01100" | "01101" | "01110" | "01111" =>
          when "10101" | "10110" | "10111" =>
            zz_12 <= sreg_rd;
          when "10001" =>
          when "10100" =>
          when "11111" =>
          when others =>
        end case;
      when "0100" =>
      when "0101" =>
      when "0111" =>
      when "1011" =>
      when others =>
    end case;
  end process;

  process(zz_14,phase_l,mop_rs,sreg_rd)
  begin
    zz_13 <= zz_14;
    case phase_l is
      when "0000" =>
      when "0001" =>
      when "0010" =>
      when "0011" =>
        case mop_rs is
          when "11000" =>
          when "11001" =>
          when "10000" =>
          when "00000" | "00001" | "00010" | "00011" | "00100" | "00101" | "00110" | "00111" | "01000" | "01001" | "01010" | "01011" | "01100" | "01101" | "01110" | "01111" =>
            zz_13 <= sreg_rd;
          when "10101" | "10110" | "10111" =>
          when "10001" =>
          when "10100" =>
          when "11111" =>
          when others =>
        end case;
      when "0100" =>
      when "0101" =>
      when "0111" =>
      when "1011" =>
      when others =>
    end case;
  end process;

  process(zz_15,phase_l,mop_rs,acc)
  begin
    zz_14 <= zz_15;
    case phase_l is
      when "0000" =>
      when "0001" =>
      when "0010" =>
      when "0011" =>
        case mop_rs is
          when "11000" =>
          when "11001" =>
          when "10000" =>
            zz_14 <= acc;
          when "00000" | "00001" | "00010" | "00011" | "00100" | "00101" | "00110" | "00111" | "01000" | "01001" | "01010" | "01011" | "01100" | "01101" | "01110" | "01111" =>
          when "10101" | "10110" | "10111" =>
          when "10001" =>
          when "10100" =>
          when "11111" =>
          when others =>
        end case;
      when "0100" =>
      when "0101" =>
      when "0111" =>
      when "1011" =>
      when others =>
    end case;
  end process;

  process(zz_16,phase_l,mop_rs,io_pi_b)
  begin
    zz_15 <= zz_16;
    case phase_l is
      when "0000" =>
      when "0001" =>
      when "0010" =>
      when "0011" =>
        case mop_rs is
          when "11000" =>
          when "11001" =>
            zz_15 <= io_pi_b;
          when "10000" =>
          when "00000" | "00001" | "00010" | "00011" | "00100" | "00101" | "00110" | "00111" | "01000" | "01001" | "01010" | "01011" | "01100" | "01101" | "01110" | "01111" =>
          when "10101" | "10110" | "10111" =>
          when "10001" =>
          when "10100" =>
          when "11111" =>
          when others =>
        end case;
      when "0100" =>
      when "0101" =>
      when "0111" =>
      when "1011" =>
      when others =>
    end case;
  end process;

  process(acc,phase_l,mop_rs,io_pi_a)
  begin
    zz_16 <= acc;
    case phase_l is
      when "0000" =>
      when "0001" =>
      when "0010" =>
      when "0011" =>
        case mop_rs is
          when "11000" =>
            zz_16 <= io_pi_a;
          when "11001" =>
          when "10000" =>
          when "00000" | "00001" | "00010" | "00011" | "00100" | "00101" | "00110" | "00111" | "01000" | "01001" | "01010" | "01011" | "01100" | "01101" | "01110" | "01111" =>
          when "10101" | "10110" | "10111" =>
          when "10001" =>
          when "10100" =>
          when "11111" =>
          when others =>
        end case;
      when "0100" =>
      when "0101" =>
      when "0111" =>
      when "1011" =>
      when others =>
    end case;
  end process;

  process(zz_18,phase_l,mop_rd,acc)
  begin
    zz_17 <= zz_18;
    case phase_l is
      when "0000" =>
      when "0001" =>
      when "0010" =>
      when "0011" =>
        case mop_rd is
          when "10000" =>
          when "00000" | "00001" | "00010" | "00011" | "00100" | "00101" | "00110" | "00111" | "01000" | "01001" | "01010" | "01011" | "01100" | "01101" | "01110" | "01111" =>
          when "10101" | "10110" | "10111" =>
          when "11111" =>
          when others =>
            zz_17 <= acc;
        end case;
      when "0100" =>
      when "0101" =>
      when "0111" =>
      when "1011" =>
      when others =>
    end case;
  end process;

  process(zz_19,phase_l,mop_rd,io_dr)
  begin
    zz_18 <= zz_19;
    case phase_l is
      when "0000" =>
      when "0001" =>
      when "0010" =>
      when "0011" =>
        case mop_rd is
          when "10000" =>
          when "00000" | "00001" | "00010" | "00011" | "00100" | "00101" | "00110" | "00111" | "01000" | "01001" | "01010" | "01011" | "01100" | "01101" | "01110" | "01111" =>
          when "10101" | "10110" | "10111" =>
          when "11111" =>
            zz_18 <= io_dr;
          when others =>
        end case;
      when "0100" =>
      when "0101" =>
      when "0111" =>
      when "1011" =>
      when others =>
    end case;
  end process;

  process(zz_20,phase_l,mop_rd,sreg_rd)
  begin
    zz_19 <= zz_20;
    case phase_l is
      when "0000" =>
      when "0001" =>
      when "0010" =>
      when "0011" =>
        case mop_rd is
          when "10000" =>
          when "00000" | "00001" | "00010" | "00011" | "00100" | "00101" | "00110" | "00111" | "01000" | "01001" | "01010" | "01011" | "01100" | "01101" | "01110" | "01111" =>
          when "10101" | "10110" | "10111" =>
            zz_19 <= sreg_rd;
          when "11111" =>
          when others =>
        end case;
      when "0100" =>
      when "0101" =>
      when "0111" =>
      when "1011" =>
      when others =>
    end case;
  end process;

  process(zz_21,phase_l,mop_rd,sreg_rd)
  begin
    zz_20 <= zz_21;
    case phase_l is
      when "0000" =>
      when "0001" =>
      when "0010" =>
      when "0011" =>
        case mop_rd is
          when "10000" =>
          when "00000" | "00001" | "00010" | "00011" | "00100" | "00101" | "00110" | "00111" | "01000" | "01001" | "01010" | "01011" | "01100" | "01101" | "01110" | "01111" =>
            zz_20 <= sreg_rd;
          when "10101" | "10110" | "10111" =>
          when "11111" =>
          when others =>
        end case;
      when "0100" =>
      when "0101" =>
      when "0111" =>
      when "1011" =>
      when others =>
    end case;
  end process;

  process(acc,phase_l,mop_rd)
  begin
    zz_21 <= acc;
    case phase_l is
      when "0000" =>
      when "0001" =>
      when "0010" =>
      when "0011" =>
        case mop_rd is
          when "10000" =>
            zz_21 <= acc;
          when "00000" | "00001" | "00010" | "00011" | "00100" | "00101" | "00110" | "00111" | "01000" | "01001" | "01010" | "01011" | "01100" | "01101" | "01110" | "01111" =>
          when "10101" | "10110" | "10111" =>
          when "11111" =>
          when others =>
        end case;
      when "0100" =>
      when "0101" =>
      when "0111" =>
      when "1011" =>
      when others =>
    end case;
  end process;

  io_acco <= acc;
  io_visaro <= visar;
  io_iozcso <= iozcs;
  process(clk)
  begin
    if rising_edge(clk) then
      if io_ce = '1' then
        sreg_wr <= pkg_toStdLogic(false);
        if ((bcc and test) or (pkg_toStdLogic(opcode = pkg_unsigned("10001111")) and pkg_toStdLogic(visarl = pkg_unsigned("111")))) = '1' then
          len_v <= pkg_enum.L;
        else
          if ((bcc and (not test)) or (pkg_toStdLogic(opcode = pkg_unsigned("10001111")) and pkg_toStdLogic(visarl /= pkg_unsigned("111")))) = '1' then
            len_v <= pkg_enum.S;
          else
            len_v <= mop_len;
          end if;
        end if;
        if (pkg_toStdLogic(phase_l = pkg_unsigned("0111")) and pkg_toStdLogic(len_v = pkg_enum.S)) = '1' then
          phase_l <= pkg_unsigned("0000");
        else
          if (pkg_toStdLogic(phase_l = pkg_unsigned("1011")) and pkg_toStdLogic(len_v = pkg_enum.L)) = '1' then
            phase_l <= pkg_unsigned("0000");
          else
            phase_l <= (phase_l + pkg_unsigned("0001"));
          end if;
        end if;
        case phase_l is
          when "0000" =>
            test <= testp;
            bcc <= bccp;
          when "0001" =>
          when "0010" =>
          when "0011" =>
            alu <= aluop_1_io_dst;
            dstm <= aluop_1_io_dstm;
            iozcs <= aluop_1_io_iozcs_o;
            testp <= aluop_1_io_test;
            bccp <= (pkg_toStdLogic(mop_op = pkg_enum.OP_TST8) or pkg_toStdLogic(mop_op = pkg_enum.OP_TST9));
          when "0100" =>
            dv <= pkg_toStdLogic(false);
            if dstm = '1' then
              case mop_rd is
                when "10000" =>
                  acc <= alu;
                when "11000" =>
                  poa_l <= alu;
                when "11001" =>
                  pob_l <= alu;
                when "10001" =>
                  iozcs <= pkg_extract(alu,4,0);
                when "10010" =>
                  visar(5 downto 3) <= pkg_extract(alu,2,0);
                when "10011" =>
                  visar(2 downto 0) <= pkg_extract(alu,2,0);
                when "10100" =>
                  visar <= pkg_extract(alu,5,0);
                when "00000" | "00001" | "00010" | "00011" | "00100" | "00101" | "00110" | "00111" | "01000" | "01001" | "01010" | "01011" | "01100" | "01101" | "01110" | "01111" =>
                  sreg_wd <= alu;
                  sreg_wa <= pkg_resize(mop_rd,6);
                  sreg_wr <= pkg_toStdLogic(true);
                when "10101" | "10110" | "10111" =>
                  sreg_wd <= alu;
                  sreg_wa <= visar;
                  sreg_wr <= pkg_toStdLogic(true);
                when "11111" =>
                  dw <= alu;
                  dv <= pkg_toStdLogic(true);
                when others =>
              end case;
            end if;
          when "0101" =>
            if (pkg_toStdLogic(mop_rs = pkg_unsigned("10110")) or pkg_toStdLogic(mop_rd = pkg_unsigned("10110"))) = '1' then
              visar(2 downto 0) <= (pkg_extract(visar,2,0) + pkg_unsigned("001"));
            end if;
            if (pkg_toStdLogic(mop_rs = pkg_unsigned("10111")) or pkg_toStdLogic(mop_rd = pkg_unsigned("10111"))) = '1' then
              visar(2 downto 0) <= (pkg_extract(visar,2,0) - pkg_unsigned("001"));
            end if;
          when "0111" =>
            if pkg_toStdLogic(len_v = pkg_enum.S) = '1' then
              if pkg_toStdLogic(mop_romc = pkg_unsigned("00000")) = '1' then
                opcode <= io_dr;
                madrs <= unsigned(pkg_cat(std_logic_vector(io_dr),std_logic_vector(pkg_unsigned("000"))));
              else
                madrs <= (madrs + pkg_unsigned("00000000001"));
              end if;
            end if;
          when "1011" =>
            if pkg_toStdLogic(len_v = pkg_enum.L) = '1' then
              if pkg_toStdLogic(mop_romc = pkg_unsigned("00000")) = '1' then
                opcode <= io_dr;
                madrs <= unsigned(pkg_cat(std_logic_vector(io_dr),std_logic_vector(pkg_unsigned("000"))));
              else
                madrs <= (madrs + pkg_unsigned("00000000001"));
              end if;
            end if;
          when others =>
        end case;
        if (not io_reset_na) = '1' then
          opcode <= pkg_unsigned("00101111");
          madrs <= pkg_unsigned("00101111000");
          phase_l <= pkg_unsigned("0000");
          iozcs <= pkg_unsigned("00000");
        end if;
      end if;
    end if;
  end process;

end arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity f8_psu is
  port(
    io_dw : in unsigned(7 downto 0);
    io_dr : out unsigned(7 downto 0);
    io_dv : out std_logic;
    io_romc : in unsigned(4 downto 0);
    io_tick : in std_logic;
    io_phase : in unsigned(3 downto 0);
    io_ext_int : in std_logic;
    io_int_req : out std_logic;
    io_pri_o : out std_logic;
    io_pri_i : in std_logic;
    io_po_a : out unsigned(7 downto 0);
    io_pi_a : in unsigned(7 downto 0);
    io_po_b : out unsigned(7 downto 0);
    io_pi_b : in unsigned(7 downto 0);
    io_load_a : in unsigned(9 downto 0);
    io_load_d : in unsigned(7 downto 0);
    io_load_wr : in std_logic;
    io_ce : in std_logic;
    io_reset_na : in std_logic;
    io_pc0o : out unsigned(15 downto 0);
    io_pc1o : out unsigned(15 downto 0);
    io_dc0o : out unsigned(15 downto 0);
    clk : in std_logic;
    reset : in std_logic
  );
end f8_psu;

architecture arch of f8_psu is
  signal zz_2 : std_logic_vector(7 downto 0);
  signal zz_3 : unsigned(1 downto 0);
  signal zz_4 : unsigned(1 downto 0);
  signal zz_5 : std_logic_vector(7 downto 0);

  signal dc0 : unsigned(15 downto 0);
  signal dc1 : unsigned(15 downto 0);
  signal pc0 : unsigned(15 downto 0);
  signal pc1 : unsigned(15 downto 0);
  signal mem_a : unsigned(15 downto 0);
  signal mem_dr : unsigned(7 downto 0);
  signal mem_dw : unsigned(7 downto 0);
  signal io_rd : std_logic;
  signal io_wr : std_logic;
  signal io_port : unsigned(7 downto 0);
  signal io_dw_1 : unsigned(7 downto 0);
  signal io_dr_1 : unsigned(7 downto 0);
  signal dr : unsigned(7 downto 0);
  signal dv : std_logic;
  signal inta_clr : std_logic;
  signal inta_set : std_logic;
  signal int_req_l : std_logic;
  signal zz_1 : unsigned(9 downto 0);
  signal icr : unsigned(1 downto 0);
  signal tim : unsigned(7 downto 0);
  signal tdiv : unsigned(4 downto 0);
  signal po_a_l : unsigned(7 downto 0);
  signal po_b_l : unsigned(7 downto 0);
  signal inta : std_logic;
  signal pri_o : std_logic;
  signal ext_int_d : std_logic;
  signal tim_int_d : std_logic;
  signal tim_int : std_logic;
  type mem_type is array (0 to 1023) of std_logic_vector(7 downto 0);
  signal mem : mem_type := (
     "01110000","00001011","01110000","01011100","00001010","00011111","00100101","01000000","10010100","11111000","01100111","01101011","00100000","00101000","01011100","00101010",
     "00001000","00000000","00010110","00100101","01010101","10010100","00000100","00101001","00001000","00000010","00100000","11010110","01010011","00101000","00000000","11010000",
     "00100000","01001010","01010000","00101000","00000000","10011001","01100011","01101100","01110100","01011100","01000100","01101111","01011100","00100101","00000011","10010001",
     "11110000","00101000","00000001","00110101","00101000","00000010","00100100","00101000","00000000","10001000","00101000","00000010","11011010","00101000","00000000","10001000",
     "00101000","00000010","11101000","00101000","00000000","10001000","00100001","00000100","10000100","00000111","00101000","00000011","10001100","00101000","00000011","10011001",
     "00101000","00000110","01011000","00101000","00000100","01100111","00101000","00000011","11010011","01100011","01101111","01001100","00100101","00000010","10010100","00000100",
     "00101000","00000100","01000111","01100100","01101111","01001100","00011111","01011100","01110000","10110000","10100000","00100001","00000100","10010100","00000100","00101000",
     "00000010","00100100","01100011","01101100","00101010","00000000","10000011","01001100","00010010","10001110","00010110","01010101","00101000","00000000","10001111","01110000",
     "10110101","10010000","10110101","00100010","00010011","00000111","00000011","00000011","01100100","01101110","01001110","01010001","01001100","01010000","00011100","00100000",
     "11111111","01010110","00110110","10010100","11111110","00110101","10010100","11111000","00011100","00001000","00101000","00000001","00000111","00100000","00110011","01010001",
     "00100000","00010011","01010010","00101000","00000110","01111001","00100000","10001011","01010000","00101000","00000110","01111001","00101000","00000000","11000001","00100000",
     "00110011","01010001","00100000","00010011","01010010","01111101","01010000","00101000","00000110","01111001","00101000","00000110","01111001","00101000","00000001","00011110",
     "00001100","10100000","00011000","00100001","00001111","10000100","11111011","01010100","00100000","11111111","01010101","00110101","10010100","11111110","10010000","11000000",
     "00001000","00101000","00000001","00000111","01110000","01010010","00100000","01111110","01010001","01000011","00100010","00010000","01010000","00101000","00000110","01111001",
     "01110101","01010001","01111101","01010000","00101000","00000110","01111001","00110001","01000001","00100101","01110000","10000001","11110110","01000010","00100100","00000101",
     "01010010","01100011","01101111","01110011","11111100","10000100","00001000","01000010","00100101","00110000","10000001","11011011","01110000","01010011","01000010","00100101",
     "01000000","10000001","11010100","00101000","00000001","00011110","00001100","00001010","01010111","01100111","01101011","01001100","00001011","00000000","01011100","00001010",
     "00011111","00001011","00000001","01011100","00001010","00011111","00001011","00001010","01100111","01101011","01011100","01000111","00001011","00011100","00001010","01010111",
     "01100111","01101011","01001100","00100100","11111111","00001011","01001100","00000101","00001010","00100100","11111111","00001011","01001100","00000100","00001010","01100111",
     "01101011","01011100","01000111","00001011","00011100","00001000","00101000","00000001","00000111","01100011","01101111","01001100","01100100","01101101","00100101","00000001",
     "10000100","00001110","00100000","01010011","01011101","01111100","01011110","00100000","11010000","01010011","00101000","00000000","11010000","10010000","00101111","00100000",
     "00010111","01011101","00100000","11111111","01011100","00100000","11010110","01010011","00101000","00000000","11010000","00100000","00010001","01010001","01111000","01010010",
     "00101000","00000001","11110110","00100000","00010001","01010001","00100000","00100101","01010010","00101000","00000001","11110110","00100000","01011100","01010001","01111000",
     "01010010","00101000","00000001","11110110","00100000","01011100","01010001","00100000","00100101","01010010","00101000","00000001","11110110","00100000","00010100","01010001",
     "01110110","01010010","00101000","00000010","00001110","00100000","00010100","01010001","00100000","00101110","01010010","00101000","00000010","00001110","00100000","10011001",
     "01100010","01101110","01011101","01011100","00101000","00000010","10101100","00101000","00000010","10110101","01100100","01101010","01110010","01011100","10010000","00000101",
     "00001000","00101000","00000001","00000111","01100010","01101000","00100000","00010111","01011100","01101011","01011100","00100000","00011100","01010001","00100000","00011010",
     "01010010","00100000","10110000","01010000","00101000","00000110","01111001","00100000","00111000","01010001","00100000","00011011","01010010","00100000","01010101","01010000",
     "00101000","00000110","01111001","00100000","01010010","01010001","00100000","00011010","01010010","00100000","01110001","01010000","00101000","00000110","01111001","01100100",
     "01101101","01001100","00010011","10000001","00000110","00101000","00000100","01000111","10010000","00011001","00100000","00010001","01010001","00100000","00011010","01010010",
     "00100000","10110010","01010000","00101000","00000110","01111001","00100000","01011110","01010001","00100000","00011010","01010010","00100000","01110011","01010000","00101000",
     "00000110","01111001","00101000","00000001","00011110","00001100","00001000","00101000","00000001","00000111","01111000","01010011","00100000","10000001","01010000","00101000",
     "00000110","01111001","01000001","00100100","11111010","01010001","01000010","00011111","01010010","00110011","10010100","11110001","10010000","11100101","00001000","00101000",
     "00000001","00000111","00100000","01000110","01010011","00100000","10010010","01010000","00101000","00000110","01111001","01000001","00100100","11111011","01010001","00110011",
     "10010100","11110100","10010000","11001111","00001000","00101000","00000001","00000111","00100000","10000101","01010000","00101000","00000000","10011001","01000100","00100101",
     "00001000","10010100","00000101","00101000","00000001","00011110","00001100","00100101","00000010","10010100","00001101","00100000","10001110","01010000","00101000","00000000",
     "10011001","01100011","01101100","01000100","01011100","10010000","11100010","00100101","00000001","10010100","11011110","00100000","10001100","01010000","00101000","00000000",
     "10011001","00101010","00000010","01101100","01000100","00010010","10001110","00010110","01100111","01101001","01011101","01110000","01011100","01100110","01101111","01111111",
     "01011100","00101000","00000010","01110001","01100100","01101101","01001100","00100010","00100000","01011100","10010000","10111101","00000010","00000101","00010000","00010000",
     "00100000","00001000","00101000","00000001","00000111","01100111","01101010","01001110","01010100","01001100","01010011","00010100","00100010","10000000","01010000","00100000",
     "00101010","01010001","00100000","00110011","01010010","00101000","00000110","01111001","01000011","00100001","00001111","00100010","10000000","01010000","00101000","00000110",
     "01111001","00100000","10010001","01010000","00101000","00000110","01111001","01000100","00010100","00100010","10000000","01010000","00101000","00000110","01111001","01000100",
     "00100001","00001111","00100010","10000000","01010000","00101000","00000110","01111001","00101000","00000001","00011110","00001100","00001000","00101000","00000001","00000111",
     "01101110","00100000","00010111","10010000","00001000","00001000","00101000","00000001","00000111","01101111","00100000","01010000","01100010","01010001","00100000","00110011",
     "01010010","01110001","00100100","01100110","11011100","01011100","00010100","00100010","01000000","01010000","00101000","00000110","01111001","01001100","00100001","00001111",
     "00100010","01000000","01010000","00101000","00000110","01111001","00101000","00000001","00011110","00001100","00001000","00101000","00000001","00000111","00100000","10110000",
     "01010100","01100010","01101001","01110000","10110100","10100100","10010000","00001101","00001000","00101000","00000001","00000111","00100000","01110001","01010100","01100010",
     "01101100","01110000","10110001","10100001","00011000","11110001","01010000","01001101","01010001","01001100","01010010","01110001","11110000","10000100","00000101","01000001",
     "00100100","00000010","01010001","01110010","11110000","10000100","00000101","01000001","00100100","11111110","01010001","01110100","11110000","10000100","00000101","01000010",
     "00100100","00000010","01010010","01111000","11110000","10000100","00000101","01000010","00100100","11111110","01010010","01100011","01101111","01001100","00100101","00000010",
     "10010001","00110110","10010100","00010111","01110001","11110100","10010100","00001011","01000001","00100101","00101101","10000001","00000100","00100000","00101101","01010001",
     "10010000","00001001","01000001","00100101","00111101","10010001","00000100","00100000","00111101","01010001","01000001","00100101","01010010","10000001","00000100","00100000",
     "01010010","01010001","00100101","00011010","10010001","00000100","00100000","00011010","01010001","01000010","00100101","00101011","10000001","00000100","00100000","00101011",
     "01010010","00100101","00001001","10010001","00000011","01111001","01010010","01100100","01101111","01001100","00100001","00000011","00100101","00000011","10010100","00100100",
     "01100010","01101000","01110001","11110100","10000100","00000010","01101011","00100000","00010000","11110000","10000100","00000010","00111100","00100000","00100000","11110000",
     "10000100","00000100","01001100","00011111","01011100","01001100","00100101","00010110","10010100","00000011","00100000","00011101","00100101","00011110","10010100","00000011",
     "00100000","00010111","01011100","01000100","01010000","00101000","00000110","01111001","00101000","00000001","00011110","00001100","00001000","00101000","00000001","00000111",
     "01101000","00100000","10110010","01010011","01110000","10110100","10100100","10010000","00001100","00001000","00101000","00000001","00000111","01101010","00100000","01110011",
     "01010011","01110000","10110001","10100001","00011000","01010000","01100011","01001101","01010001","01001100","01010010","01000000","00100001","10000000","10000100","00000101",
     "01000010","00100100","00000010","01010010","01000000","00100001","01000000","10000100","00000011","00110010","00110010","01000010","00100101","00010100","10010001","00000100",
     "00100000","00010100","01010010","00100101","00100000","10000001","00000100","00100000","00100000","01010010","01000011","01010000","00101000","00000110","01111001","00101000",
     "00000001","00011110","00001100","00001000","00101000","00000001","00000111","01100100","01101000","01001101","01010001","01001101","01010010","01001101","01010011","01001101",
     "01010100","01001100","00100101","00000000","10000100","00001101","01110000","01011100","01000011","00010011","11000011","11000011","01010011","01000100","00010011","11000100",
     "11000100","01010100","01000001","11000011","01010001","01000010","11000100","01010010","01100100","01101101","00100000","01000100","11111100","10000100","00111101","00101000");
begin
  zz_3 <= pkg_extract(io_port,1,0);
  zz_4 <= pkg_extract(io_port,1,0);
  zz_5 <= std_logic_vector(io_load_d);
  process(clk)
  begin
    if rising_edge(clk) then
      if io_ce = '1' then
        zz_2 <= mem(to_integer(zz_1));
      end if;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      if io_load_wr = '1' then
        mem(to_integer(io_load_a)) <= zz_5;
      end if;
    end if;
  end process;

  io_dr <= dr;
  io_dv <= dv;
  mem_a <= pkg_mux((pkg_toStdLogic(io_romc = pkg_unsigned("00010")) or pkg_toStdLogic(io_romc = pkg_unsigned("00101"))),dc0,pc0);
  zz_1 <= pkg_extract(mem_a,9,0);
  mem_dr <= unsigned(zz_2);
  io_pri_o <= pri_o;
  io_po_a <= po_a_l;
  io_po_b <= po_b_l;
  io_int_req <= int_req_l;
  io_pc0o <= pc0;
  io_pc1o <= pc1;
  io_dc0o <= dc0;
  process(clk)
  begin
    if rising_edge(clk) then
      if io_ce = '1' then
        inta_clr <= pkg_toStdLogic(false);
        if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
          dv <= pkg_toStdLogic(false);
        end if;
        io_wr <= pkg_toStdLogic(false);
        case io_romc is
          when "00000" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= mem_dr;
              dv <= pkg_toStdLogic(pkg_extract(pc0,15,10) = pkg_unsigned("000000"));
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc0 <= (pc0 + pkg_unsigned("0000000000000001"));
            end if;
          when "00001" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= mem_dr;
              dv <= pkg_toStdLogic(pkg_extract(pc0,15,10) = pkg_unsigned("000000"));
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc0 <= (pc0 + unsigned(pkg_resize(signed(io_dw),16)));
            end if;
          when "00010" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= mem_dr;
              dv <= pkg_toStdLogic(pkg_extract(dc0,15,10) = pkg_unsigned("000000"));
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              dc0 <= (dc0 + pkg_unsigned("0000000000000001"));
            end if;
          when "00011" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= mem_dr;
              dv <= pkg_toStdLogic(pkg_extract(pc0,15,10) = pkg_unsigned("000000"));
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc0 <= (pc0 + pkg_unsigned("0000000000000001"));
              io_port <= io_dw;
            end if;
          when "00100" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc0 <= pc1;
            end if;
          when "00101" =>
          when "00110" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= pkg_extract(dc0,15,8);
              dv <= pkg_toStdLogic(true);
            end if;
          when "00111" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= pkg_extract(pc1,15,8);
              dv <= pkg_toStdLogic(true);
            end if;
          when "01000" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc1 <= pc0;
              pc0 <= pkg_unsigned("0000000000000000");
            end if;
          when "01001" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= pkg_extract(dc0,7,0);
              dv <= pkg_toStdLogic(pkg_extract(dc0,15,10) = pkg_unsigned("000000"));
            end if;
          when "01010" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              dc0 <= (dc0 + unsigned(pkg_resize(signed(io_dw),16)));
            end if;
          when "01011" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= pkg_extract(pc1,7,0);
              dv <= pkg_toStdLogic(pkg_extract(pc1,15,10) = pkg_unsigned("000000"));
            end if;
          when "01100" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= mem_dr;
              dv <= pkg_toStdLogic(pkg_extract(pc0,15,10) = pkg_unsigned("000000"));
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc0(7 downto 0) <= io_dw;
            end if;
          when "01101" =>
            pc1 <= (pc0 + pkg_unsigned("0000000000000001"));
          when "01110" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= mem_dr;
              dv <= pkg_toStdLogic(pkg_extract(pc0,15,10) = pkg_unsigned("000000"));
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              dc0(7 downto 0) <= io_dw;
            end if;
          when "01111" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= pkg_extract(pkg_unsigned("1111111111111111"),7,0);
              dv <= int_req_l;
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc1 <= pc0;
              pc0(7 downto 0) <= io_dw;
            end if;
          when "10000" =>
          when "10001" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= mem_dr;
              dv <= pkg_toStdLogic(pkg_extract(pc0,15,10) = pkg_unsigned("000000"));
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              dc0(15 downto 8) <= io_dw;
            end if;
          when "10010" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc1 <= pc0;
              pc0(7 downto 0) <= io_dw;
            end if;
          when "10011" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= pkg_extract(pkg_unsigned("1111111111111111"),15,8);
              dv <= int_req_l;
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc0(15 downto 8) <= io_dw;
              inta_clr <= int_req_l;
            end if;
          when "10100" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc0(15 downto 8) <= io_dw;
            end if;
          when "10101" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc1(15 downto 8) <= io_dw;
            end if;
          when "10110" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              dc0(15 downto 8) <= io_dw;
            end if;
          when "10111" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc0(7 downto 0) <= io_dw;
            end if;
          when "11000" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc1(7 downto 0) <= io_dw;
            end if;
          when "11001" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              dc0(7 downto 0) <= io_dw;
            end if;
          when "11010" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              io_dw_1 <= io_dw;
              io_wr <= pkg_toStdLogic(pkg_extract(io_port,7,2) = pkg_unsigned("000001"));
            end if;
          when "11011" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              io_rd <= pkg_toStdLogic(pkg_extract(io_port,7,2) = pkg_unsigned("000001"));
              dr <= io_dr_1;
              dv <= pkg_toStdLogic(pkg_extract(io_port,7,2) = pkg_unsigned("000001"));
            end if;
          when "11100" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              io_port <= io_dw;
            end if;
          when "11101" =>
          when "11110" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= pkg_extract(pc0,7,0);
              dv <= pkg_toStdLogic(pkg_extract(pc0,15,10) = pkg_unsigned("000000"));
            end if;
          when others =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= pkg_extract(pc0,15,8);
              dv <= pkg_toStdLogic(pkg_extract(pc0,15,10) = pkg_unsigned("000000"));
            end if;
        end case;
        if (not io_reset_na) = '1' then
          pc0 <= pkg_unsigned("0000000000000000");
          pc1 <= pkg_unsigned("0000000000000000");
          dc0 <= pkg_unsigned("0000000000000000");
        end if;
      end if;
      if io_ce = '1' then
        tdiv <= (tdiv + pkg_unsigned("00001"));
        if pkg_toStdLogic(tdiv = pkg_unsigned("00000")) = '1' then
          tim(0) <= ((pkg_extract(tim,3) xor pkg_extract(tim,4)) xor (not (pkg_extract(tim,5) xor pkg_extract(tim,7))));
          tim(7 downto 1) <= pkg_extract(tim,6,0);
        end if;
        tim_int <= pkg_toStdLogic(tim = pkg_unsigned("11111110"));
        tim_int_d <= tim_int;
        ext_int_d <= io_ext_int;
        inta_set <= ((((not ext_int_d) and io_ext_int) and pkg_toStdLogic(icr = pkg_unsigned("01"))) or (((not tim_int_d) and tim_int) and pkg_toStdLogic(icr = pkg_unsigned("11"))));
        inta <= ((inta or inta_set) and (not inta_clr));
        int_req_l <= (inta and io_pri_i);
        pri_o <= (io_pri_i and (not inta));
        case zz_3 is
          when "00" =>
            io_dr_1 <= (io_pi_a and po_a_l);
          when "01" =>
            io_dr_1 <= (io_pi_b and po_b_l);
          when "10" =>
            io_dr_1 <= pkg_unsigned("00000000");
          when others =>
            io_dr_1 <= pkg_unsigned("00000000");
        end case;
        if io_wr = '1' then
          case zz_4 is
            when "00" =>
              po_a_l <= io_dw_1;
            when "01" =>
              po_b_l <= io_dw_1;
            when "10" =>
              tim <= io_dw_1;
            when others =>
              icr <= pkg_extract(io_dw_1,1,0);
          end case;
        end if;
        if (not io_reset_na) = '1' then
          po_a_l <= pkg_unsigned("00000000");
          po_b_l <= pkg_unsigned("00000000");
        end if;
      end if;
    end if;
  end process;

end arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity f8_psu_1 is
  port(
    io_dw : in unsigned(7 downto 0);
    io_dr : out unsigned(7 downto 0);
    io_dv : out std_logic;
    io_romc : in unsigned(4 downto 0);
    io_tick : in std_logic;
    io_phase : in unsigned(3 downto 0);
    io_ext_int : in std_logic;
    io_int_req : out std_logic;
    io_pri_o : out std_logic;
    io_pri_i : in std_logic;
    io_po_a : out unsigned(7 downto 0);
    io_pi_a : in unsigned(7 downto 0);
    io_po_b : out unsigned(7 downto 0);
    io_pi_b : in unsigned(7 downto 0);
    io_load_a : in unsigned(9 downto 0);
    io_load_d : in unsigned(7 downto 0);
    io_load_wr : in std_logic;
    io_ce : in std_logic;
    io_reset_na : in std_logic;
    io_pc0o : out unsigned(15 downto 0);
    io_pc1o : out unsigned(15 downto 0);
    io_dc0o : out unsigned(15 downto 0);
    clk : in std_logic;
    reset : in std_logic
  );
end f8_psu_1;

architecture arch of f8_psu_1 is
  signal zz_2 : std_logic_vector(7 downto 0);
  signal zz_3 : unsigned(1 downto 0);
  signal zz_4 : unsigned(1 downto 0);
  signal zz_5 : std_logic_vector(7 downto 0);

  signal dc0 : unsigned(15 downto 0);
  signal dc1 : unsigned(15 downto 0);
  signal pc0 : unsigned(15 downto 0);
  signal pc1 : unsigned(15 downto 0);
  signal mem_a : unsigned(15 downto 0);
  signal mem_dr : unsigned(7 downto 0);
  signal mem_dw : unsigned(7 downto 0);
  signal io_rd : std_logic;
  signal io_wr : std_logic;
  signal io_port : unsigned(7 downto 0);
  signal io_dw_1 : unsigned(7 downto 0);
  signal io_dr_1 : unsigned(7 downto 0);
  signal dr : unsigned(7 downto 0);
  signal dv : std_logic;
  signal inta_clr : std_logic;
  signal inta_set : std_logic;
  signal int_req_l : std_logic;
  signal zz_1 : unsigned(9 downto 0);
  signal icr : unsigned(1 downto 0);
  signal tim : unsigned(7 downto 0);
  signal tdiv : unsigned(4 downto 0);
  signal po_a_l : unsigned(7 downto 0);
  signal po_b_l : unsigned(7 downto 0);
  signal inta : std_logic;
  signal pri_o : std_logic;
  signal ext_int_d : std_logic;
  signal tim_int_d : std_logic;
  signal tim_int : std_logic;
  type mem_type is array (0 to 1023) of std_logic_vector(7 downto 0);
  signal mem : mem_type := (
     "00000100","10011100","01100100","01101010","01000001","01010000","00100101","01011100","10000001","00000111","00101000","00000100","00111111","00100000","01011100","01010001",
     "01000001","01010000","00100101","00010100","10010001","00000111","00101000","00000100","00111111","00100000","00010100","01010001","01101011","01000010","01010000","00100101",
     "00001000","10010001","00000111","00101000","00000100","00111111","00100000","00001001","01010010","01000010","01010000","00100101","00101110","10000001","00000111","00101000",
     "00000100","00111111","00100000","00101110","01010010","00100000","01010101","01010000","00101000","00000110","01111001","00101000","00000001","00011110","00001100","01001100",
     "00011000","00011111","01011100","00100000","01000000","10110101","00011100","00001000","00101000","00000001","00000111","00100000","00110110","01010001","01111010","01010010",
     "01110101","01010100","00100000","10000001","01010000","00101000","00000110","01111001","01000001","00100100","11111010","01010001","01000010","00100100","00001000","01010010",
     "00110100","10010100","11110000","00101000","00000001","00011110","00001100","00001000","00101000","00000001","00000111","01100111","01101000","01001100","00100010","00000000",
     "10000100","00100111","01110000","01011100","01101010","01110001","01010000","00011000","11011100","00100100","01100110","11010000","01011100","00100101","10011001","10010100",
     "00010101","00100000","01011001","01011110","01110001","01010000","00011000","11011100","00100100","01100110","11010000","00100101","10011001","10010100","00000110","00101000",
     "00000010","00100100","10010000","00000101","01011100","00101000","00000010","01110001","00101000","00000001","00011110","00001100","00001000","00101000","00000001","00000111",
     "01100100","01101111","01110001","11111100","10000100","00010011","01100010","01101100","00101000","00000101","11111100","00110000","10000100","00111011","01100010","01101001",
     "00101000","00000101","11111100","00110000","10000100","00110000","10010000","00010001","01100010","01101001","00101000","00000101","11111100","00110000","10000100","00100110",
     "01100010","01101100","00101000","00000101","11111100","00110000","10000100","00100001","01100100","01101101","01001100","00100001","00000100","10010100","00000100","00101001",
     "00000101","10011101","01100011","01101000","00101000","00000101","11111100","00110000","10000100","01111100","01100011","01101010","00101000","00000101","11111100","00110000",
     "10000100","01111000","00101001","00000101","10001000","01101000","10010000","00000010","01101011","01100010","01001101","01010100","01001101","01001100","01010111","01100100",
     "01101101","01001100","00010011","01000100","10000001","00100001","00101010","00000101","00001110","01110111","01010100","00110111","00110111","01000100","11000111","01010011",
     "01000010","00011000","00011111","11000011","10000100","00000100","00110100","10000001","11110101","01000100","10001110","00010110","10010000","00001011","00000100","00000100",
     "00000101","00000110","00000000","00000001","00000010","00000011","00100100","11101001","00101010","00000101","01000111","00010011","10001110","00010110","01010101","00010110",
     "01010110","01100100","01101010","01001100","00100010","00000000","10010001","00010011","01000101","00011000","00011111","01010101","01101101","01001100","00010011","01101010",
     "10010001","00000101","01000110","00011000","00011111","01010110","01000001","00100100","00000010","01010001","01000101","01011101","01000110","01011101","01110010","01011100",
     "00100000","10000000","10110101","00101000","00000001","00011110","00001100","00000010","00000000","00000010","00000001","00000010","00000010","00000001","00000010","00000001",
     "11111110","00000010","11111110","00000010","11111111","01110001","01010011","10010000","00000011","01110010","01010011","01100100","01101010","01001100","00110011","10000100",
     "00000111","00100010","00000000","10000001","00000111","10010000","00001000","00100010","00000000","10000001","00000100","00011000","00011111","01011100","00100000","10000000",
     "10110101","01101011","01001100","00100010","00000000","10010100","00010000","01100010","01101001","01001100","00100001","00000001","10000100","00000100","01110010","10010000",
     "00000011","00100000","11111110","01100100","01101011","01011100","10010000","01101100","01000010","00100101","00010100","10000001","00001110","00100101","00100100","10010001",
     "00001010","01000001","00100101","00010100","10000001","00010100","00100101","01011100","10010001","00010000","00101001","00000101","01000011","01000001","00100101","00010100",
     "10000001","00001000","00100101","01011100","10010001","00000100","00101001","00000101","01000011","01100100","01101010","01001101","00010011","10010001","00000101","00100100",
     "00000010","10010000","00000011","00100100","11111110","11000001","01010001","01101011","01001100","11000010","01010010","00100000","01010101","01010000","00101000","00000110",
     "01111001","01100100","01101011","01110000","01011100","01100100","01101000","01001100","00100101","00110000","10010001","00000110","00101000","00000010","10110101","10010000",
     "00000100","00101000","00000010","10101100","00100000","11111111","01010101","00101000","00000000","10001111","01100011","01101111","01001100","00100101","00000010","10010100",
     "00010000","01100010","01101110","01001101","00100101","00010101","10000100","00000110","01001100","00100101","00010101","10010100","00000100","00101000","00000010","00100100",
     "00101000","00000001","10100000","00101000","00000001","00011110","00101000","00000001","00011110","00101001","00000000","00110111","00001000","00101000","00000001","00000111",
     "01001100","00011000","00011111","11000001","10010001","00001011","01001100","00100100","00000101","01010110","01000001","00011000","00011111","11001100","10000001","00010111",
     "01001100","00011000","00011111","01010110","01000001","00100100","00000010","11000110","10010001","00110110","01000001","00100100","00000010","00011000","00011111","01010110",
     "01001100","00100100","00000101","11000110","10010001","00101010","01001101","01001100","00011000","00011111","01010110","01000010","11000110","10010001","00001011","01000010",
     "00011000","00011111","01010110","01001100","00100100","00000101","11000110","10000001","00011101","01001100","00011000","00011111","01010110","01000010","00100100","00000010",
     "11000110","10010001","00001101","01000010","00100100","00000010","00011000","00011111","01010110","01001100","00100100","00000101","11000110","10000001","00000111","01110000",
     "01010000","00101000","00000001","00011110","00001100","01110001","10010000","11111001","00101010","00000110","01110100","01100100","01101101","01001100","00100001","00100000",
     "10000100","00010010","01100110","01101111","00111100","10010100","00001101","01100011","01101100","01001100","00010010","10001110","00010110","01100110","01101111","01011101",
     "01100111","01110001","01011100","00011100","00001001","00001101","00010101","00011100","00011100","00101010","00000111","01100111","00001000","00101000","00000001","00000111",
     "00001010","01100110","01101100","01011101","01000011","01011101","01000100","01011100","01110101","01010100","00100000","11000000","11110000","01010011","00100000","00111111",
     "11110000","01010000","00100101","00010101","10010100","00011111","01100100","01101000","01110010","01010100","00101000","00000110","11101100","00100000","00010101","01010000",
     "00101000","00000111","00011000","01000001","00100100","00000110","01010001","01100110","01101101","01001101","01010011","01001100","01010100","01101100","01001100","00001011",
     "00101000","00000001","00011110","00001100","00100101","00110000","10010100","00001011","01100010","01101001","00101000","00000110","11101100","01101000","01001101","01010000",
     "10010000","11011111","00100101","00110001","10010100","00001011","01100010","01101100","00101000","00000110","11101100","01101011","01001101","01010000","10010000","11010001",
     "00100101","00110010","10010100","00001011","01100011","01101000","00101000","00000110","11101100","00100000","00010100","01010000","10010000","11000011","00100101","00110011",
     "10010100","10111111","01100011","01101010","00101000","00000110","11101100","00100000","00010100","01010000","10010000","10110101","00001000","00101000","00000001","00000111",
     "01001100","11100001","10010100","00000110","01001101","01001110","11100010","10000100","00011100","01000001","01010101","01000010","01010110","01001100","01010001","01000101",
     "01011101","01001100","01010010","01000110","01011110","01111101","01010000","00101010","00000111","01100111","00101000","00000111","00011000","00101010","00000111","01100111",
     "01001101","01010001","01001110","01010010","00101000","00000001","00011110","00001100","01000000","00010011","10001110","11000000","10001110","00100000","01000000","10110000",
     "01000100","01010110","01010101","00010110","01010111","01000010","00100100","00000000","00011000","00100001","00111111","01011000","10100101","00100001","11000000","11001000",
     "10110101","01000001","00100100","11111100","00011000","10110100","01000111","00100010","00000000","01000011","10010001","00000010","01110000","00011000","10110001","01000111",
     "00010011","01010111","00100000","01100000","10110000","00100000","01010000","10110000","01000001","00011111","01010001","01110100","01011000","00111000","10010100","11111110",
     "00110101","10010100","11011111","01000010","00011111","01010010","01000100","00011000","00011111","11000001","01010001","01000100","00110110","10010100","11000100","01000100",
     "00011000","00011111","11000010","01010010","01110000","10110000","00011100","11111000","10001000","10001000","10001000","11111000","00100000","00100000","00100000","00100000",
     "00100000","11111000","00001000","11111000","10000000","11111000","11111000","00001000","11111000","00001000","11111000","10001000","10001000","11111000","00001000","00001000",
     "11111000","10000000","11111000","00001000","11111000","11111000","10000000","11111000","10001000","11111000","11111000","00001000","00010000","00010000","00010000","11111000",
     "10001000","11111000","10001000","11111000","11111000","10001000","11111000","00001000","11111000","11111000","10000000","10011000","10001000","11111000","11111000","00001000",
     "00111000","00000000","00100000","11111000","00100000","00100000","00100000","00100000","00000000","00000000","00000000","00000000","00000000","11111000","10101000","10101000",
     "10101000","10101000","10001000","01010000","00100000","01010000","10001000","11111111","11111111","11111111","11111111","11111111","00000000","00100000","00000000","00100000",
     "00000000","00000000","00000000","11111000","00000000","00000000","01010000","01010000","01010000","01010000","01010000","10100000","10100000","10100000","10100000","10100000",
     "11000000","11000000","00000000","00000000","00000000","00001000","00001000","00001000","00001000","00001000","00100000","00100000","00100000","00100000","00100000","00010000",
     "00010000","00100000","01000000","01000000","00001000","00010000","00100000","01000000","10000000","00000000","00011000","00100000","11000000","00000000","00000000","11000000",
     "00100000","00011000","00000000","10000000","01000000","00100000","00010000","00001000","01000000","01000000","00100000","00010000","00010000","00000000","00000000","00000000");
begin
  zz_3 <= pkg_extract(io_port,1,0);
  zz_4 <= pkg_extract(io_port,1,0);
  zz_5 <= std_logic_vector(io_load_d);
  process(clk)
  begin
    if rising_edge(clk) then
      if io_ce = '1' then
        zz_2 <= mem(to_integer(zz_1));
      end if;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      if io_load_wr = '1' then
        mem(to_integer(io_load_a)) <= zz_5;
      end if;
    end if;
  end process;

  io_dr <= dr;
  io_dv <= dv;
  mem_a <= pkg_mux((pkg_toStdLogic(io_romc = pkg_unsigned("00010")) or pkg_toStdLogic(io_romc = pkg_unsigned("00101"))),dc0,pc0);
  zz_1 <= pkg_extract(mem_a,9,0);
  mem_dr <= unsigned(zz_2);
  io_pri_o <= pri_o;
  io_po_a <= po_a_l;
  io_po_b <= po_b_l;
  io_int_req <= int_req_l;
  io_pc0o <= pc0;
  io_pc1o <= pc1;
  io_dc0o <= dc0;
  process(clk)
  begin
    if rising_edge(clk) then
      if io_ce = '1' then
        inta_clr <= pkg_toStdLogic(false);
        if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
          dv <= pkg_toStdLogic(false);
        end if;
        io_wr <= pkg_toStdLogic(false);
        case io_romc is
          when "00000" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= mem_dr;
              dv <= pkg_toStdLogic(pkg_extract(pc0,15,10) = pkg_unsigned("000001"));
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc0 <= (pc0 + pkg_unsigned("0000000000000001"));
            end if;
          when "00001" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= mem_dr;
              dv <= pkg_toStdLogic(pkg_extract(pc0,15,10) = pkg_unsigned("000001"));
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc0 <= (pc0 + unsigned(pkg_resize(signed(io_dw),16)));
            end if;
          when "00010" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= mem_dr;
              dv <= pkg_toStdLogic(pkg_extract(dc0,15,10) = pkg_unsigned("000001"));
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              dc0 <= (dc0 + pkg_unsigned("0000000000000001"));
            end if;
          when "00011" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= mem_dr;
              dv <= pkg_toStdLogic(pkg_extract(pc0,15,10) = pkg_unsigned("000001"));
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc0 <= (pc0 + pkg_unsigned("0000000000000001"));
              io_port <= io_dw;
            end if;
          when "00100" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc0 <= pc1;
            end if;
          when "00101" =>
          when "00110" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= pkg_extract(dc0,15,8);
              dv <= pkg_toStdLogic(true);
            end if;
          when "00111" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= pkg_extract(pc1,15,8);
              dv <= pkg_toStdLogic(true);
            end if;
          when "01000" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc1 <= pc0;
              pc0 <= pkg_unsigned("0000000000000000");
            end if;
          when "01001" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= pkg_extract(dc0,7,0);
              dv <= pkg_toStdLogic(pkg_extract(dc0,15,10) = pkg_unsigned("000001"));
            end if;
          when "01010" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              dc0 <= (dc0 + unsigned(pkg_resize(signed(io_dw),16)));
            end if;
          when "01011" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= pkg_extract(pc1,7,0);
              dv <= pkg_toStdLogic(pkg_extract(pc1,15,10) = pkg_unsigned("000001"));
            end if;
          when "01100" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= mem_dr;
              dv <= pkg_toStdLogic(pkg_extract(pc0,15,10) = pkg_unsigned("000001"));
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc0(7 downto 0) <= io_dw;
            end if;
          when "01101" =>
            pc1 <= (pc0 + pkg_unsigned("0000000000000001"));
          when "01110" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= mem_dr;
              dv <= pkg_toStdLogic(pkg_extract(pc0,15,10) = pkg_unsigned("000001"));
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              dc0(7 downto 0) <= io_dw;
            end if;
          when "01111" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= pkg_extract(pkg_unsigned("1111111111111111"),7,0);
              dv <= int_req_l;
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc1 <= pc0;
              pc0(7 downto 0) <= io_dw;
            end if;
          when "10000" =>
          when "10001" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= mem_dr;
              dv <= pkg_toStdLogic(pkg_extract(pc0,15,10) = pkg_unsigned("000001"));
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              dc0(15 downto 8) <= io_dw;
            end if;
          when "10010" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc1 <= pc0;
              pc0(7 downto 0) <= io_dw;
            end if;
          when "10011" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= pkg_extract(pkg_unsigned("1111111111111111"),15,8);
              dv <= int_req_l;
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc0(15 downto 8) <= io_dw;
              inta_clr <= int_req_l;
            end if;
          when "10100" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc0(15 downto 8) <= io_dw;
            end if;
          when "10101" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc1(15 downto 8) <= io_dw;
            end if;
          when "10110" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              dc0(15 downto 8) <= io_dw;
            end if;
          when "10111" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc0(7 downto 0) <= io_dw;
            end if;
          when "11000" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc1(7 downto 0) <= io_dw;
            end if;
          when "11001" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              dc0(7 downto 0) <= io_dw;
            end if;
          when "11010" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              io_dw_1 <= io_dw;
              io_wr <= pkg_toStdLogic(pkg_extract(io_port,7,2) = pkg_unsigned("111111"));
            end if;
          when "11011" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              io_rd <= pkg_toStdLogic(pkg_extract(io_port,7,2) = pkg_unsigned("111111"));
              dr <= io_dr_1;
              dv <= pkg_toStdLogic(pkg_extract(io_port,7,2) = pkg_unsigned("111111"));
            end if;
          when "11100" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              io_port <= io_dw;
            end if;
          when "11101" =>
          when "11110" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= pkg_extract(pc0,7,0);
              dv <= pkg_toStdLogic(pkg_extract(pc0,15,10) = pkg_unsigned("000001"));
            end if;
          when others =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= pkg_extract(pc0,15,8);
              dv <= pkg_toStdLogic(pkg_extract(pc0,15,10) = pkg_unsigned("000001"));
            end if;
        end case;
        if (not io_reset_na) = '1' then
          pc0 <= pkg_unsigned("0000000000000000");
          pc1 <= pkg_unsigned("0000000000000000");
          dc0 <= pkg_unsigned("0000000000000000");
        end if;
      end if;
      if io_ce = '1' then
        tdiv <= (tdiv + pkg_unsigned("00001"));
        if pkg_toStdLogic(tdiv = pkg_unsigned("00000")) = '1' then
          tim(0) <= ((pkg_extract(tim,3) xor pkg_extract(tim,4)) xor (not (pkg_extract(tim,5) xor pkg_extract(tim,7))));
          tim(7 downto 1) <= pkg_extract(tim,6,0);
        end if;
        tim_int <= pkg_toStdLogic(tim = pkg_unsigned("11111110"));
        tim_int_d <= tim_int;
        ext_int_d <= io_ext_int;
        inta_set <= ((((not ext_int_d) and io_ext_int) and pkg_toStdLogic(icr = pkg_unsigned("01"))) or (((not tim_int_d) and tim_int) and pkg_toStdLogic(icr = pkg_unsigned("11"))));
        inta <= ((inta or inta_set) and (not inta_clr));
        int_req_l <= (inta and io_pri_i);
        pri_o <= (io_pri_i and (not inta));
        case zz_3 is
          when "00" =>
            io_dr_1 <= (io_pi_a and po_a_l);
          when "01" =>
            io_dr_1 <= (io_pi_b and po_b_l);
          when "10" =>
            io_dr_1 <= pkg_unsigned("00000000");
          when others =>
            io_dr_1 <= pkg_unsigned("00000000");
        end case;
        if io_wr = '1' then
          case zz_4 is
            when "00" =>
              po_a_l <= io_dw_1;
            when "01" =>
              po_b_l <= io_dw_1;
            when "10" =>
              tim <= io_dw_1;
            when others =>
              icr <= pkg_extract(io_dw_1,1,0);
          end case;
        end if;
        if (not io_reset_na) = '1' then
          po_a_l <= pkg_unsigned("00000000");
          po_b_l <= pkg_unsigned("00000000");
        end if;
      end if;
    end if;
  end process;

end arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity f8_psu_2 is
  port(
    io_dw : in unsigned(7 downto 0);
    io_dr : out unsigned(7 downto 0);
    io_dv : out std_logic;
    io_romc : in unsigned(4 downto 0);
    io_tick : in std_logic;
    io_phase : in unsigned(3 downto 0);
    io_ext_int : in std_logic;
    io_int_req : out std_logic;
    io_pri_o : out std_logic;
    io_pri_i : in std_logic;
    io_po_a : out unsigned(7 downto 0);
    io_pi_a : in unsigned(7 downto 0);
    io_po_b : out unsigned(7 downto 0);
    io_pi_b : in unsigned(7 downto 0);
    io_load_a : in unsigned(9 downto 0);
    io_load_d : in unsigned(7 downto 0);
    io_load_wr : in std_logic;
    io_ce : in std_logic;
    io_reset_na : in std_logic;
    io_pc0o : out unsigned(15 downto 0);
    io_pc1o : out unsigned(15 downto 0);
    io_dc0o : out unsigned(15 downto 0);
    clk : in std_logic;
    reset : in std_logic
  );
end f8_psu_2;

architecture arch of f8_psu_2 is
  signal zz_2 : std_logic_vector(7 downto 0);
  signal zz_3 : unsigned(1 downto 0);
  signal zz_4 : unsigned(1 downto 0);
  signal zz_5 : std_logic_vector(7 downto 0);

  signal dc0 : unsigned(15 downto 0);
  signal dc1 : unsigned(15 downto 0);
  signal pc0 : unsigned(15 downto 0);
  signal pc1 : unsigned(15 downto 0);
  signal mem_a : unsigned(15 downto 0);
  signal mem_dr : unsigned(7 downto 0);
  signal mem_dw : unsigned(7 downto 0);
  signal io_rd : std_logic;
  signal io_wr : std_logic;
  signal io_port : unsigned(7 downto 0);
  signal io_dw_1 : unsigned(7 downto 0);
  signal io_dr_1 : unsigned(7 downto 0);
  signal dr : unsigned(7 downto 0);
  signal dv : std_logic;
  signal inta_clr : std_logic;
  signal inta_set : std_logic;
  signal int_req_l : std_logic;
  signal zz_1 : unsigned(9 downto 0);
  signal icr : unsigned(1 downto 0);
  signal tim : unsigned(7 downto 0);
  signal tdiv : unsigned(4 downto 0);
  signal po_a_l : unsigned(7 downto 0);
  signal po_b_l : unsigned(7 downto 0);
  signal inta : std_logic;
  signal pri_o : std_logic;
  signal ext_int_d : std_logic;
  signal tim_int_d : std_logic;
  signal tim_int : std_logic;
  type mem_type is array (0 to 1023) of std_logic_vector(7 downto 0);
  signal mem : mem_type := (
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000");
begin
  zz_3 <= pkg_extract(io_port,1,0);
  zz_4 <= pkg_extract(io_port,1,0);
  zz_5 <= std_logic_vector(io_load_d);
  process(clk)
  begin
    if rising_edge(clk) then
      if io_ce = '1' then
        zz_2 <= mem(to_integer(zz_1));
      end if;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      if io_load_wr = '1' then
        mem(to_integer(io_load_a)) <= zz_5;
      end if;
    end if;
  end process;

  io_dr <= dr;
  io_dv <= dv;
  mem_a <= pkg_mux((pkg_toStdLogic(io_romc = pkg_unsigned("00010")) or pkg_toStdLogic(io_romc = pkg_unsigned("00101"))),dc0,pc0);
  zz_1 <= pkg_extract(mem_a,9,0);
  mem_dr <= unsigned(zz_2);
  io_pri_o <= pri_o;
  io_po_a <= po_a_l;
  io_po_b <= po_b_l;
  io_int_req <= int_req_l;
  io_pc0o <= pc0;
  io_pc1o <= pc1;
  io_dc0o <= dc0;
  process(clk)
  begin
    if rising_edge(clk) then
      if io_ce = '1' then
        inta_clr <= pkg_toStdLogic(false);
        if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
          dv <= pkg_toStdLogic(false);
        end if;
        io_wr <= pkg_toStdLogic(false);
        case io_romc is
          when "00000" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= mem_dr;
              dv <= pkg_toStdLogic(pkg_extract(pc0,15,10) = pkg_unsigned("000010"));
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc0 <= (pc0 + pkg_unsigned("0000000000000001"));
            end if;
          when "00001" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= mem_dr;
              dv <= pkg_toStdLogic(pkg_extract(pc0,15,10) = pkg_unsigned("000010"));
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc0 <= (pc0 + unsigned(pkg_resize(signed(io_dw),16)));
            end if;
          when "00010" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= mem_dr;
              dv <= pkg_toStdLogic(pkg_extract(dc0,15,10) = pkg_unsigned("000010"));
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              dc0 <= (dc0 + pkg_unsigned("0000000000000001"));
            end if;
          when "00011" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= mem_dr;
              dv <= pkg_toStdLogic(pkg_extract(pc0,15,10) = pkg_unsigned("000010"));
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc0 <= (pc0 + pkg_unsigned("0000000000000001"));
              io_port <= io_dw;
            end if;
          when "00100" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc0 <= pc1;
            end if;
          when "00101" =>
          when "00110" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= pkg_extract(dc0,15,8);
              dv <= pkg_toStdLogic(true);
            end if;
          when "00111" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= pkg_extract(pc1,15,8);
              dv <= pkg_toStdLogic(true);
            end if;
          when "01000" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc1 <= pc0;
              pc0 <= pkg_unsigned("0000000000000000");
            end if;
          when "01001" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= pkg_extract(dc0,7,0);
              dv <= pkg_toStdLogic(pkg_extract(dc0,15,10) = pkg_unsigned("000010"));
            end if;
          when "01010" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              dc0 <= (dc0 + unsigned(pkg_resize(signed(io_dw),16)));
            end if;
          when "01011" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= pkg_extract(pc1,7,0);
              dv <= pkg_toStdLogic(pkg_extract(pc1,15,10) = pkg_unsigned("000010"));
            end if;
          when "01100" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= mem_dr;
              dv <= pkg_toStdLogic(pkg_extract(pc0,15,10) = pkg_unsigned("000010"));
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc0(7 downto 0) <= io_dw;
            end if;
          when "01101" =>
            pc1 <= (pc0 + pkg_unsigned("0000000000000001"));
          when "01110" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= mem_dr;
              dv <= pkg_toStdLogic(pkg_extract(pc0,15,10) = pkg_unsigned("000010"));
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              dc0(7 downto 0) <= io_dw;
            end if;
          when "01111" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= pkg_extract(pkg_unsigned("1111111111111111"),7,0);
              dv <= int_req_l;
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc1 <= pc0;
              pc0(7 downto 0) <= io_dw;
            end if;
          when "10000" =>
          when "10001" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= mem_dr;
              dv <= pkg_toStdLogic(pkg_extract(pc0,15,10) = pkg_unsigned("000010"));
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              dc0(15 downto 8) <= io_dw;
            end if;
          when "10010" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc1 <= pc0;
              pc0(7 downto 0) <= io_dw;
            end if;
          when "10011" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= pkg_extract(pkg_unsigned("1111111111111111"),15,8);
              dv <= int_req_l;
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc0(15 downto 8) <= io_dw;
              inta_clr <= int_req_l;
            end if;
          when "10100" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc0(15 downto 8) <= io_dw;
            end if;
          when "10101" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc1(15 downto 8) <= io_dw;
            end if;
          when "10110" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              dc0(15 downto 8) <= io_dw;
            end if;
          when "10111" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc0(7 downto 0) <= io_dw;
            end if;
          when "11000" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc1(7 downto 0) <= io_dw;
            end if;
          when "11001" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              dc0(7 downto 0) <= io_dw;
            end if;
          when "11010" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              io_dw_1 <= io_dw;
              io_wr <= pkg_toStdLogic(pkg_extract(io_port,7,2) = pkg_unsigned("111110"));
            end if;
          when "11011" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              io_rd <= pkg_toStdLogic(pkg_extract(io_port,7,2) = pkg_unsigned("111110"));
              dr <= io_dr_1;
              dv <= pkg_toStdLogic(pkg_extract(io_port,7,2) = pkg_unsigned("111110"));
            end if;
          when "11100" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              io_port <= io_dw;
            end if;
          when "11101" =>
          when "11110" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= pkg_extract(pc0,7,0);
              dv <= pkg_toStdLogic(pkg_extract(pc0,15,10) = pkg_unsigned("000010"));
            end if;
          when others =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= pkg_extract(pc0,15,8);
              dv <= pkg_toStdLogic(pkg_extract(pc0,15,10) = pkg_unsigned("000010"));
            end if;
        end case;
        if (not io_reset_na) = '1' then
          pc0 <= pkg_unsigned("0000000000000000");
          pc1 <= pkg_unsigned("0000000000000000");
          dc0 <= pkg_unsigned("0000000000000000");
        end if;
      end if;
      if io_ce = '1' then
        tdiv <= (tdiv + pkg_unsigned("00001"));
        if pkg_toStdLogic(tdiv = pkg_unsigned("00000")) = '1' then
          tim(0) <= ((pkg_extract(tim,3) xor pkg_extract(tim,4)) xor (not (pkg_extract(tim,5) xor pkg_extract(tim,7))));
          tim(7 downto 1) <= pkg_extract(tim,6,0);
        end if;
        tim_int <= pkg_toStdLogic(tim = pkg_unsigned("11111110"));
        tim_int_d <= tim_int;
        ext_int_d <= io_ext_int;
        inta_set <= ((((not ext_int_d) and io_ext_int) and pkg_toStdLogic(icr = pkg_unsigned("01"))) or (((not tim_int_d) and tim_int) and pkg_toStdLogic(icr = pkg_unsigned("11"))));
        inta <= ((inta or inta_set) and (not inta_clr));
        int_req_l <= (inta and io_pri_i);
        pri_o <= (io_pri_i and (not inta));
        case zz_3 is
          when "00" =>
            io_dr_1 <= (io_pi_a and po_a_l);
          when "01" =>
            io_dr_1 <= (io_pi_b and po_b_l);
          when "10" =>
            io_dr_1 <= pkg_unsigned("00000000");
          when others =>
            io_dr_1 <= pkg_unsigned("00000000");
        end case;
        if io_wr = '1' then
          case zz_4 is
            when "00" =>
              po_a_l <= io_dw_1;
            when "01" =>
              po_b_l <= io_dw_1;
            when "10" =>
              tim <= io_dw_1;
            when others =>
              icr <= pkg_extract(io_dw_1,1,0);
          end case;
        end if;
        if (not io_reset_na) = '1' then
          po_a_l <= pkg_unsigned("00000000");
          po_b_l <= pkg_unsigned("00000000");
        end if;
      end if;
    end if;
  end process;

end arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity f8_psu_3 is
  port(
    io_dw : in unsigned(7 downto 0);
    io_dr : out unsigned(7 downto 0);
    io_dv : out std_logic;
    io_romc : in unsigned(4 downto 0);
    io_tick : in std_logic;
    io_phase : in unsigned(3 downto 0);
    io_ext_int : in std_logic;
    io_int_req : out std_logic;
    io_pri_o : out std_logic;
    io_pri_i : in std_logic;
    io_po_a : out unsigned(7 downto 0);
    io_pi_a : in unsigned(7 downto 0);
    io_po_b : out unsigned(7 downto 0);
    io_pi_b : in unsigned(7 downto 0);
    io_load_a : in unsigned(9 downto 0);
    io_load_d : in unsigned(7 downto 0);
    io_load_wr : in std_logic;
    io_ce : in std_logic;
    io_reset_na : in std_logic;
    io_pc0o : out unsigned(15 downto 0);
    io_pc1o : out unsigned(15 downto 0);
    io_dc0o : out unsigned(15 downto 0);
    clk : in std_logic;
    reset : in std_logic
  );
end f8_psu_3;

architecture arch of f8_psu_3 is
  signal zz_2 : std_logic_vector(7 downto 0);
  signal zz_3 : unsigned(1 downto 0);
  signal zz_4 : unsigned(1 downto 0);
  signal zz_5 : std_logic_vector(7 downto 0);

  signal dc0 : unsigned(15 downto 0);
  signal dc1 : unsigned(15 downto 0);
  signal pc0 : unsigned(15 downto 0);
  signal pc1 : unsigned(15 downto 0);
  signal mem_a : unsigned(15 downto 0);
  signal mem_dr : unsigned(7 downto 0);
  signal mem_dw : unsigned(7 downto 0);
  signal io_rd : std_logic;
  signal io_wr : std_logic;
  signal io_port : unsigned(7 downto 0);
  signal io_dw_1 : unsigned(7 downto 0);
  signal io_dr_1 : unsigned(7 downto 0);
  signal dr : unsigned(7 downto 0);
  signal dv : std_logic;
  signal inta_clr : std_logic;
  signal inta_set : std_logic;
  signal int_req_l : std_logic;
  signal zz_1 : unsigned(9 downto 0);
  signal icr : unsigned(1 downto 0);
  signal tim : unsigned(7 downto 0);
  signal tdiv : unsigned(4 downto 0);
  signal po_a_l : unsigned(7 downto 0);
  signal po_b_l : unsigned(7 downto 0);
  signal inta : std_logic;
  signal pri_o : std_logic;
  signal ext_int_d : std_logic;
  signal tim_int_d : std_logic;
  signal tim_int : std_logic;
  type mem_type is array (0 to 1023) of std_logic_vector(7 downto 0);
  signal mem : mem_type := (
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000");
begin
  zz_3 <= pkg_extract(io_port,1,0);
  zz_4 <= pkg_extract(io_port,1,0);
  zz_5 <= std_logic_vector(io_load_d);
  process(clk)
  begin
    if rising_edge(clk) then
      if io_ce = '1' then
        zz_2 <= mem(to_integer(zz_1));
      end if;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      if io_load_wr = '1' then
        mem(to_integer(io_load_a)) <= zz_5;
      end if;
    end if;
  end process;

  io_dr <= dr;
  io_dv <= dv;
  mem_a <= pkg_mux((pkg_toStdLogic(io_romc = pkg_unsigned("00010")) or pkg_toStdLogic(io_romc = pkg_unsigned("00101"))),dc0,pc0);
  zz_1 <= pkg_extract(mem_a,9,0);
  mem_dr <= unsigned(zz_2);
  io_pri_o <= pri_o;
  io_po_a <= po_a_l;
  io_po_b <= po_b_l;
  io_int_req <= int_req_l;
  io_pc0o <= pc0;
  io_pc1o <= pc1;
  io_dc0o <= dc0;
  process(clk)
  begin
    if rising_edge(clk) then
      if io_ce = '1' then
        inta_clr <= pkg_toStdLogic(false);
        if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
          dv <= pkg_toStdLogic(false);
        end if;
        io_wr <= pkg_toStdLogic(false);
        case io_romc is
          when "00000" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= mem_dr;
              dv <= pkg_toStdLogic(pkg_extract(pc0,15,10) = pkg_unsigned("000011"));
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc0 <= (pc0 + pkg_unsigned("0000000000000001"));
            end if;
          when "00001" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= mem_dr;
              dv <= pkg_toStdLogic(pkg_extract(pc0,15,10) = pkg_unsigned("000011"));
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc0 <= (pc0 + unsigned(pkg_resize(signed(io_dw),16)));
            end if;
          when "00010" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= mem_dr;
              dv <= pkg_toStdLogic(pkg_extract(dc0,15,10) = pkg_unsigned("000011"));
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              dc0 <= (dc0 + pkg_unsigned("0000000000000001"));
            end if;
          when "00011" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= mem_dr;
              dv <= pkg_toStdLogic(pkg_extract(pc0,15,10) = pkg_unsigned("000011"));
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc0 <= (pc0 + pkg_unsigned("0000000000000001"));
              io_port <= io_dw;
            end if;
          when "00100" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc0 <= pc1;
            end if;
          when "00101" =>
          when "00110" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= pkg_extract(dc0,15,8);
              dv <= pkg_toStdLogic(true);
            end if;
          when "00111" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= pkg_extract(pc1,15,8);
              dv <= pkg_toStdLogic(true);
            end if;
          when "01000" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc1 <= pc0;
              pc0 <= pkg_unsigned("0000000000000000");
            end if;
          when "01001" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= pkg_extract(dc0,7,0);
              dv <= pkg_toStdLogic(pkg_extract(dc0,15,10) = pkg_unsigned("000011"));
            end if;
          when "01010" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              dc0 <= (dc0 + unsigned(pkg_resize(signed(io_dw),16)));
            end if;
          when "01011" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= pkg_extract(pc1,7,0);
              dv <= pkg_toStdLogic(pkg_extract(pc1,15,10) = pkg_unsigned("000011"));
            end if;
          when "01100" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= mem_dr;
              dv <= pkg_toStdLogic(pkg_extract(pc0,15,10) = pkg_unsigned("000011"));
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc0(7 downto 0) <= io_dw;
            end if;
          when "01101" =>
            pc1 <= (pc0 + pkg_unsigned("0000000000000001"));
          when "01110" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= mem_dr;
              dv <= pkg_toStdLogic(pkg_extract(pc0,15,10) = pkg_unsigned("000011"));
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              dc0(7 downto 0) <= io_dw;
            end if;
          when "01111" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= pkg_extract(pkg_unsigned("1111111111111111"),7,0);
              dv <= int_req_l;
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc1 <= pc0;
              pc0(7 downto 0) <= io_dw;
            end if;
          when "10000" =>
          when "10001" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= mem_dr;
              dv <= pkg_toStdLogic(pkg_extract(pc0,15,10) = pkg_unsigned("000011"));
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              dc0(15 downto 8) <= io_dw;
            end if;
          when "10010" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc1 <= pc0;
              pc0(7 downto 0) <= io_dw;
            end if;
          when "10011" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= pkg_extract(pkg_unsigned("1111111111111111"),15,8);
              dv <= int_req_l;
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc0(15 downto 8) <= io_dw;
              inta_clr <= int_req_l;
            end if;
          when "10100" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc0(15 downto 8) <= io_dw;
            end if;
          when "10101" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc1(15 downto 8) <= io_dw;
            end if;
          when "10110" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              dc0(15 downto 8) <= io_dw;
            end if;
          when "10111" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc0(7 downto 0) <= io_dw;
            end if;
          when "11000" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc1(7 downto 0) <= io_dw;
            end if;
          when "11001" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              dc0(7 downto 0) <= io_dw;
            end if;
          when "11010" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              io_dw_1 <= io_dw;
              io_wr <= pkg_toStdLogic(pkg_extract(io_port,7,2) = pkg_unsigned("111101"));
            end if;
          when "11011" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              io_rd <= pkg_toStdLogic(pkg_extract(io_port,7,2) = pkg_unsigned("111101"));
              dr <= io_dr_1;
              dv <= pkg_toStdLogic(pkg_extract(io_port,7,2) = pkg_unsigned("111101"));
            end if;
          when "11100" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              io_port <= io_dw;
            end if;
          when "11101" =>
          when "11110" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= pkg_extract(pc0,7,0);
              dv <= pkg_toStdLogic(pkg_extract(pc0,15,10) = pkg_unsigned("000011"));
            end if;
          when others =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= pkg_extract(pc0,15,8);
              dv <= pkg_toStdLogic(pkg_extract(pc0,15,10) = pkg_unsigned("000011"));
            end if;
        end case;
        if (not io_reset_na) = '1' then
          pc0 <= pkg_unsigned("0000000000000000");
          pc1 <= pkg_unsigned("0000000000000000");
          dc0 <= pkg_unsigned("0000000000000000");
        end if;
      end if;
      if io_ce = '1' then
        tdiv <= (tdiv + pkg_unsigned("00001"));
        if pkg_toStdLogic(tdiv = pkg_unsigned("00000")) = '1' then
          tim(0) <= ((pkg_extract(tim,3) xor pkg_extract(tim,4)) xor (not (pkg_extract(tim,5) xor pkg_extract(tim,7))));
          tim(7 downto 1) <= pkg_extract(tim,6,0);
        end if;
        tim_int <= pkg_toStdLogic(tim = pkg_unsigned("11111110"));
        tim_int_d <= tim_int;
        ext_int_d <= io_ext_int;
        inta_set <= ((((not ext_int_d) and io_ext_int) and pkg_toStdLogic(icr = pkg_unsigned("01"))) or (((not tim_int_d) and tim_int) and pkg_toStdLogic(icr = pkg_unsigned("11"))));
        inta <= ((inta or inta_set) and (not inta_clr));
        int_req_l <= (inta and io_pri_i);
        pri_o <= (io_pri_i and (not inta));
        case zz_3 is
          when "00" =>
            io_dr_1 <= (io_pi_a and po_a_l);
          when "01" =>
            io_dr_1 <= (io_pi_b and po_b_l);
          when "10" =>
            io_dr_1 <= pkg_unsigned("00000000");
          when others =>
            io_dr_1 <= pkg_unsigned("00000000");
        end case;
        if io_wr = '1' then
          case zz_4 is
            when "00" =>
              po_a_l <= io_dw_1;
            when "01" =>
              po_b_l <= io_dw_1;
            when "10" =>
              tim <= io_dw_1;
            when others =>
              icr <= pkg_extract(io_dw_1,1,0);
          end case;
        end if;
        if (not io_reset_na) = '1' then
          po_a_l <= pkg_unsigned("00000000");
          po_b_l <= pkg_unsigned("00000000");
        end if;
      end if;
    end if;
  end process;

end arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity f8_psu_4 is
  port(
    io_dw : in unsigned(7 downto 0);
    io_dr : out unsigned(7 downto 0);
    io_dv : out std_logic;
    io_romc : in unsigned(4 downto 0);
    io_tick : in std_logic;
    io_phase : in unsigned(3 downto 0);
    io_ext_int : in std_logic;
    io_int_req : out std_logic;
    io_pri_o : out std_logic;
    io_pri_i : in std_logic;
    io_po_a : out unsigned(7 downto 0);
    io_pi_a : in unsigned(7 downto 0);
    io_po_b : out unsigned(7 downto 0);
    io_pi_b : in unsigned(7 downto 0);
    io_load_a : in unsigned(9 downto 0);
    io_load_d : in unsigned(7 downto 0);
    io_load_wr : in std_logic;
    io_ce : in std_logic;
    io_reset_na : in std_logic;
    io_pc0o : out unsigned(15 downto 0);
    io_pc1o : out unsigned(15 downto 0);
    io_dc0o : out unsigned(15 downto 0);
    clk : in std_logic;
    reset : in std_logic
  );
end f8_psu_4;

architecture arch of f8_psu_4 is
  signal zz_2 : std_logic_vector(7 downto 0);
  signal zz_3 : unsigned(1 downto 0);
  signal zz_4 : unsigned(1 downto 0);
  signal zz_5 : std_logic_vector(7 downto 0);

  signal dc0 : unsigned(15 downto 0);
  signal dc1 : unsigned(15 downto 0);
  signal pc0 : unsigned(15 downto 0);
  signal pc1 : unsigned(15 downto 0);
  signal mem_a : unsigned(15 downto 0);
  signal mem_dr : unsigned(7 downto 0);
  signal mem_dw : unsigned(7 downto 0);
  signal io_rd : std_logic;
  signal io_wr : std_logic;
  signal io_port : unsigned(7 downto 0);
  signal io_dw_1 : unsigned(7 downto 0);
  signal io_dr_1 : unsigned(7 downto 0);
  signal dr : unsigned(7 downto 0);
  signal dv : std_logic;
  signal inta_clr : std_logic;
  signal inta_set : std_logic;
  signal int_req_l : std_logic;
  signal zz_1 : unsigned(9 downto 0);
  signal icr : unsigned(1 downto 0);
  signal tim : unsigned(7 downto 0);
  signal tdiv : unsigned(4 downto 0);
  signal po_a_l : unsigned(7 downto 0);
  signal po_b_l : unsigned(7 downto 0);
  signal inta : std_logic;
  signal pri_o : std_logic;
  signal ext_int_d : std_logic;
  signal tim_int_d : std_logic;
  signal tim_int : std_logic;
  type mem_type is array (0 to 1023) of std_logic_vector(7 downto 0);
  signal mem : mem_type := (
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000");
begin
  zz_3 <= pkg_extract(io_port,1,0);
  zz_4 <= pkg_extract(io_port,1,0);
  zz_5 <= std_logic_vector(io_load_d);
  process(clk)
  begin
    if rising_edge(clk) then
      if io_ce = '1' then
        zz_2 <= mem(to_integer(zz_1));
      end if;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      if io_load_wr = '1' then
        mem(to_integer(io_load_a)) <= zz_5;
      end if;
    end if;
  end process;

  io_dr <= dr;
  io_dv <= dv;
  mem_a <= pkg_mux((pkg_toStdLogic(io_romc = pkg_unsigned("00010")) or pkg_toStdLogic(io_romc = pkg_unsigned("00101"))),dc0,pc0);
  zz_1 <= pkg_extract(mem_a,9,0);
  mem_dr <= unsigned(zz_2);
  io_pri_o <= pri_o;
  io_po_a <= po_a_l;
  io_po_b <= po_b_l;
  io_int_req <= int_req_l;
  io_pc0o <= pc0;
  io_pc1o <= pc1;
  io_dc0o <= dc0;
  process(clk)
  begin
    if rising_edge(clk) then
      if io_ce = '1' then
        inta_clr <= pkg_toStdLogic(false);
        if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
          dv <= pkg_toStdLogic(false);
        end if;
        io_wr <= pkg_toStdLogic(false);
        case io_romc is
          when "00000" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= mem_dr;
              dv <= pkg_toStdLogic(pkg_extract(pc0,15,10) = pkg_unsigned("000100"));
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc0 <= (pc0 + pkg_unsigned("0000000000000001"));
            end if;
          when "00001" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= mem_dr;
              dv <= pkg_toStdLogic(pkg_extract(pc0,15,10) = pkg_unsigned("000100"));
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc0 <= (pc0 + unsigned(pkg_resize(signed(io_dw),16)));
            end if;
          when "00010" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= mem_dr;
              dv <= pkg_toStdLogic(pkg_extract(dc0,15,10) = pkg_unsigned("000100"));
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              dc0 <= (dc0 + pkg_unsigned("0000000000000001"));
            end if;
          when "00011" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= mem_dr;
              dv <= pkg_toStdLogic(pkg_extract(pc0,15,10) = pkg_unsigned("000100"));
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc0 <= (pc0 + pkg_unsigned("0000000000000001"));
              io_port <= io_dw;
            end if;
          when "00100" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc0 <= pc1;
            end if;
          when "00101" =>
          when "00110" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= pkg_extract(dc0,15,8);
              dv <= pkg_toStdLogic(true);
            end if;
          when "00111" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= pkg_extract(pc1,15,8);
              dv <= pkg_toStdLogic(true);
            end if;
          when "01000" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc1 <= pc0;
              pc0 <= pkg_unsigned("0000000000000000");
            end if;
          when "01001" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= pkg_extract(dc0,7,0);
              dv <= pkg_toStdLogic(pkg_extract(dc0,15,10) = pkg_unsigned("000100"));
            end if;
          when "01010" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              dc0 <= (dc0 + unsigned(pkg_resize(signed(io_dw),16)));
            end if;
          when "01011" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= pkg_extract(pc1,7,0);
              dv <= pkg_toStdLogic(pkg_extract(pc1,15,10) = pkg_unsigned("000100"));
            end if;
          when "01100" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= mem_dr;
              dv <= pkg_toStdLogic(pkg_extract(pc0,15,10) = pkg_unsigned("000100"));
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc0(7 downto 0) <= io_dw;
            end if;
          when "01101" =>
            pc1 <= (pc0 + pkg_unsigned("0000000000000001"));
          when "01110" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= mem_dr;
              dv <= pkg_toStdLogic(pkg_extract(pc0,15,10) = pkg_unsigned("000100"));
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              dc0(7 downto 0) <= io_dw;
            end if;
          when "01111" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= pkg_extract(pkg_unsigned("1111111111111111"),7,0);
              dv <= int_req_l;
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc1 <= pc0;
              pc0(7 downto 0) <= io_dw;
            end if;
          when "10000" =>
          when "10001" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= mem_dr;
              dv <= pkg_toStdLogic(pkg_extract(pc0,15,10) = pkg_unsigned("000100"));
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              dc0(15 downto 8) <= io_dw;
            end if;
          when "10010" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc1 <= pc0;
              pc0(7 downto 0) <= io_dw;
            end if;
          when "10011" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= pkg_extract(pkg_unsigned("1111111111111111"),15,8);
              dv <= int_req_l;
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc0(15 downto 8) <= io_dw;
              inta_clr <= int_req_l;
            end if;
          when "10100" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc0(15 downto 8) <= io_dw;
            end if;
          when "10101" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc1(15 downto 8) <= io_dw;
            end if;
          when "10110" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              dc0(15 downto 8) <= io_dw;
            end if;
          when "10111" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc0(7 downto 0) <= io_dw;
            end if;
          when "11000" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc1(7 downto 0) <= io_dw;
            end if;
          when "11001" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              dc0(7 downto 0) <= io_dw;
            end if;
          when "11010" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              io_dw_1 <= io_dw;
              io_wr <= pkg_toStdLogic(pkg_extract(io_port,7,2) = pkg_unsigned("111100"));
            end if;
          when "11011" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              io_rd <= pkg_toStdLogic(pkg_extract(io_port,7,2) = pkg_unsigned("111100"));
              dr <= io_dr_1;
              dv <= pkg_toStdLogic(pkg_extract(io_port,7,2) = pkg_unsigned("111100"));
            end if;
          when "11100" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              io_port <= io_dw;
            end if;
          when "11101" =>
          when "11110" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= pkg_extract(pc0,7,0);
              dv <= pkg_toStdLogic(pkg_extract(pc0,15,10) = pkg_unsigned("000100"));
            end if;
          when others =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= pkg_extract(pc0,15,8);
              dv <= pkg_toStdLogic(pkg_extract(pc0,15,10) = pkg_unsigned("000100"));
            end if;
        end case;
        if (not io_reset_na) = '1' then
          pc0 <= pkg_unsigned("0000000000000000");
          pc1 <= pkg_unsigned("0000000000000000");
          dc0 <= pkg_unsigned("0000000000000000");
        end if;
      end if;
      if io_ce = '1' then
        tdiv <= (tdiv + pkg_unsigned("00001"));
        if pkg_toStdLogic(tdiv = pkg_unsigned("00000")) = '1' then
          tim(0) <= ((pkg_extract(tim,3) xor pkg_extract(tim,4)) xor (not (pkg_extract(tim,5) xor pkg_extract(tim,7))));
          tim(7 downto 1) <= pkg_extract(tim,6,0);
        end if;
        tim_int <= pkg_toStdLogic(tim = pkg_unsigned("11111110"));
        tim_int_d <= tim_int;
        ext_int_d <= io_ext_int;
        inta_set <= ((((not ext_int_d) and io_ext_int) and pkg_toStdLogic(icr = pkg_unsigned("01"))) or (((not tim_int_d) and tim_int) and pkg_toStdLogic(icr = pkg_unsigned("11"))));
        inta <= ((inta or inta_set) and (not inta_clr));
        int_req_l <= (inta and io_pri_i);
        pri_o <= (io_pri_i and (not inta));
        case zz_3 is
          when "00" =>
            io_dr_1 <= (io_pi_a and po_a_l);
          when "01" =>
            io_dr_1 <= (io_pi_b and po_b_l);
          when "10" =>
            io_dr_1 <= pkg_unsigned("00000000");
          when others =>
            io_dr_1 <= pkg_unsigned("00000000");
        end case;
        if io_wr = '1' then
          case zz_4 is
            when "00" =>
              po_a_l <= io_dw_1;
            when "01" =>
              po_b_l <= io_dw_1;
            when "10" =>
              tim <= io_dw_1;
            when others =>
              icr <= pkg_extract(io_dw_1,1,0);
          end case;
        end if;
        if (not io_reset_na) = '1' then
          po_a_l <= pkg_unsigned("00000000");
          po_b_l <= pkg_unsigned("00000000");
        end if;
      end if;
    end if;
  end process;

end arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity f8_psu_5 is
  port(
    io_dw : in unsigned(7 downto 0);
    io_dr : out unsigned(7 downto 0);
    io_dv : out std_logic;
    io_romc : in unsigned(4 downto 0);
    io_tick : in std_logic;
    io_phase : in unsigned(3 downto 0);
    io_ext_int : in std_logic;
    io_int_req : out std_logic;
    io_pri_o : out std_logic;
    io_pri_i : in std_logic;
    io_po_a : out unsigned(7 downto 0);
    io_pi_a : in unsigned(7 downto 0);
    io_po_b : out unsigned(7 downto 0);
    io_pi_b : in unsigned(7 downto 0);
    io_load_a : in unsigned(9 downto 0);
    io_load_d : in unsigned(7 downto 0);
    io_load_wr : in std_logic;
    io_ce : in std_logic;
    io_reset_na : in std_logic;
    io_pc0o : out unsigned(15 downto 0);
    io_pc1o : out unsigned(15 downto 0);
    io_dc0o : out unsigned(15 downto 0);
    clk : in std_logic;
    reset : in std_logic
  );
end f8_psu_5;

architecture arch of f8_psu_5 is
  signal zz_2 : std_logic_vector(7 downto 0);
  signal zz_3 : unsigned(1 downto 0);
  signal zz_4 : unsigned(1 downto 0);
  signal zz_5 : std_logic_vector(7 downto 0);

  signal dc0 : unsigned(15 downto 0);
  signal dc1 : unsigned(15 downto 0);
  signal pc0 : unsigned(15 downto 0);
  signal pc1 : unsigned(15 downto 0);
  signal mem_a : unsigned(15 downto 0);
  signal mem_dr : unsigned(7 downto 0);
  signal mem_dw : unsigned(7 downto 0);
  signal io_rd : std_logic;
  signal io_wr : std_logic;
  signal io_port : unsigned(7 downto 0);
  signal io_dw_1 : unsigned(7 downto 0);
  signal io_dr_1 : unsigned(7 downto 0);
  signal dr : unsigned(7 downto 0);
  signal dv : std_logic;
  signal inta_clr : std_logic;
  signal inta_set : std_logic;
  signal int_req_l : std_logic;
  signal zz_1 : unsigned(9 downto 0);
  signal icr : unsigned(1 downto 0);
  signal tim : unsigned(7 downto 0);
  signal tdiv : unsigned(4 downto 0);
  signal po_a_l : unsigned(7 downto 0);
  signal po_b_l : unsigned(7 downto 0);
  signal inta : std_logic;
  signal pri_o : std_logic;
  signal ext_int_d : std_logic;
  signal tim_int_d : std_logic;
  signal tim_int : std_logic;
  type mem_type is array (0 to 1023) of std_logic_vector(7 downto 0);
  signal mem : mem_type := (
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
     "00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000");
begin
  zz_3 <= pkg_extract(io_port,1,0);
  zz_4 <= pkg_extract(io_port,1,0);
  zz_5 <= std_logic_vector(io_load_d);
  process(clk)
  begin
    if rising_edge(clk) then
      if io_ce = '1' then
        zz_2 <= mem(to_integer(zz_1));
      end if;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      if io_load_wr = '1' then
        mem(to_integer(io_load_a)) <= zz_5;
      end if;
    end if;
  end process;

  io_dr <= dr;
  io_dv <= dv;
  mem_a <= pkg_mux((pkg_toStdLogic(io_romc = pkg_unsigned("00010")) or pkg_toStdLogic(io_romc = pkg_unsigned("00101"))),dc0,pc0);
  zz_1 <= pkg_extract(mem_a,9,0);
  mem_dr <= unsigned(zz_2);
  io_pri_o <= pri_o;
  io_po_a <= po_a_l;
  io_po_b <= po_b_l;
  io_int_req <= int_req_l;
  io_pc0o <= pc0;
  io_pc1o <= pc1;
  io_dc0o <= dc0;
  process(clk)
  begin
    if rising_edge(clk) then
      if io_ce = '1' then
        inta_clr <= pkg_toStdLogic(false);
        if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
          dv <= pkg_toStdLogic(false);
        end if;
        io_wr <= pkg_toStdLogic(false);
        case io_romc is
          when "00000" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= mem_dr;
              dv <= pkg_toStdLogic(pkg_extract(pc0,15,10) = pkg_unsigned("000101"));
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc0 <= (pc0 + pkg_unsigned("0000000000000001"));
            end if;
          when "00001" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= mem_dr;
              dv <= pkg_toStdLogic(pkg_extract(pc0,15,10) = pkg_unsigned("000101"));
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc0 <= (pc0 + unsigned(pkg_resize(signed(io_dw),16)));
            end if;
          when "00010" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= mem_dr;
              dv <= pkg_toStdLogic(pkg_extract(dc0,15,10) = pkg_unsigned("000101"));
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              dc0 <= (dc0 + pkg_unsigned("0000000000000001"));
            end if;
          when "00011" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= mem_dr;
              dv <= pkg_toStdLogic(pkg_extract(pc0,15,10) = pkg_unsigned("000101"));
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc0 <= (pc0 + pkg_unsigned("0000000000000001"));
              io_port <= io_dw;
            end if;
          when "00100" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc0 <= pc1;
            end if;
          when "00101" =>
          when "00110" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= pkg_extract(dc0,15,8);
              dv <= pkg_toStdLogic(true);
            end if;
          when "00111" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= pkg_extract(pc1,15,8);
              dv <= pkg_toStdLogic(true);
            end if;
          when "01000" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc1 <= pc0;
              pc0 <= pkg_unsigned("0000000000000000");
            end if;
          when "01001" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= pkg_extract(dc0,7,0);
              dv <= pkg_toStdLogic(pkg_extract(dc0,15,10) = pkg_unsigned("000101"));
            end if;
          when "01010" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              dc0 <= (dc0 + unsigned(pkg_resize(signed(io_dw),16)));
            end if;
          when "01011" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= pkg_extract(pc1,7,0);
              dv <= pkg_toStdLogic(pkg_extract(pc1,15,10) = pkg_unsigned("000101"));
            end if;
          when "01100" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= mem_dr;
              dv <= pkg_toStdLogic(pkg_extract(pc0,15,10) = pkg_unsigned("000101"));
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc0(7 downto 0) <= io_dw;
            end if;
          when "01101" =>
            pc1 <= (pc0 + pkg_unsigned("0000000000000001"));
          when "01110" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= mem_dr;
              dv <= pkg_toStdLogic(pkg_extract(pc0,15,10) = pkg_unsigned("000101"));
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              dc0(7 downto 0) <= io_dw;
            end if;
          when "01111" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= pkg_extract(pkg_unsigned("1111111111111111"),7,0);
              dv <= int_req_l;
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc1 <= pc0;
              pc0(7 downto 0) <= io_dw;
            end if;
          when "10000" =>
          when "10001" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= mem_dr;
              dv <= pkg_toStdLogic(pkg_extract(pc0,15,10) = pkg_unsigned("000101"));
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              dc0(15 downto 8) <= io_dw;
            end if;
          when "10010" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc1 <= pc0;
              pc0(7 downto 0) <= io_dw;
            end if;
          when "10011" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= pkg_extract(pkg_unsigned("1111111111111111"),15,8);
              dv <= int_req_l;
            end if;
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc0(15 downto 8) <= io_dw;
              inta_clr <= int_req_l;
            end if;
          when "10100" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc0(15 downto 8) <= io_dw;
            end if;
          when "10101" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc1(15 downto 8) <= io_dw;
            end if;
          when "10110" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              dc0(15 downto 8) <= io_dw;
            end if;
          when "10111" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc0(7 downto 0) <= io_dw;
            end if;
          when "11000" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              pc1(7 downto 0) <= io_dw;
            end if;
          when "11001" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              dc0(7 downto 0) <= io_dw;
            end if;
          when "11010" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              io_dw_1 <= io_dw;
              io_wr <= pkg_toStdLogic(pkg_extract(io_port,7,2) = pkg_unsigned("111011"));
            end if;
          when "11011" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              io_rd <= pkg_toStdLogic(pkg_extract(io_port,7,2) = pkg_unsigned("111011"));
              dr <= io_dr_1;
              dv <= pkg_toStdLogic(pkg_extract(io_port,7,2) = pkg_unsigned("111011"));
            end if;
          when "11100" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0110")) = '1' then
              io_port <= io_dw;
            end if;
          when "11101" =>
          when "11110" =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= pkg_extract(pc0,7,0);
              dv <= pkg_toStdLogic(pkg_extract(pc0,15,10) = pkg_unsigned("000101"));
            end if;
          when others =>
            if pkg_toStdLogic(io_phase = pkg_unsigned("0010")) = '1' then
              dr <= pkg_extract(pc0,15,8);
              dv <= pkg_toStdLogic(pkg_extract(pc0,15,10) = pkg_unsigned("000101"));
            end if;
        end case;
        if (not io_reset_na) = '1' then
          pc0 <= pkg_unsigned("0000000000000000");
          pc1 <= pkg_unsigned("0000000000000000");
          dc0 <= pkg_unsigned("0000000000000000");
        end if;
      end if;
      if io_ce = '1' then
        tdiv <= (tdiv + pkg_unsigned("00001"));
        if pkg_toStdLogic(tdiv = pkg_unsigned("00000")) = '1' then
          tim(0) <= ((pkg_extract(tim,3) xor pkg_extract(tim,4)) xor (not (pkg_extract(tim,5) xor pkg_extract(tim,7))));
          tim(7 downto 1) <= pkg_extract(tim,6,0);
        end if;
        tim_int <= pkg_toStdLogic(tim = pkg_unsigned("11111110"));
        tim_int_d <= tim_int;
        ext_int_d <= io_ext_int;
        inta_set <= ((((not ext_int_d) and io_ext_int) and pkg_toStdLogic(icr = pkg_unsigned("01"))) or (((not tim_int_d) and tim_int) and pkg_toStdLogic(icr = pkg_unsigned("11"))));
        inta <= ((inta or inta_set) and (not inta_clr));
        int_req_l <= (inta and io_pri_i);
        pri_o <= (io_pri_i and (not inta));
        case zz_3 is
          when "00" =>
            io_dr_1 <= (io_pi_a and po_a_l);
          when "01" =>
            io_dr_1 <= (io_pi_b and po_b_l);
          when "10" =>
            io_dr_1 <= pkg_unsigned("00000000");
          when others =>
            io_dr_1 <= pkg_unsigned("00000000");
        end case;
        if io_wr = '1' then
          case zz_4 is
            when "00" =>
              po_a_l <= io_dw_1;
            when "01" =>
              po_b_l <= io_dw_1;
            when "10" =>
              tim <= io_dw_1;
            when others =>
              icr <= pkg_extract(io_dw_1,1,0);
          end case;
        end if;
        if (not io_reset_na) = '1' then
          po_a_l <= pkg_unsigned("00000000");
          po_b_l <= pkg_unsigned("00000000");
        end if;
      end if;
    end if;
  end process;

end arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity chf_core is
  port(
    io_pll_locked : in std_logic;
    io_pal : in std_logic;
    io_reset : in std_logic;
    io_vga_ce : out std_logic;
    io_vga_r : out unsigned(7 downto 0);
    io_vga_g : out unsigned(7 downto 0);
    io_vga_b : out unsigned(7 downto 0);
    io_vga_hs : out std_logic;
    io_vga_vs : out std_logic;
    io_vga_de : out std_logic;
    io_joystick_0 : in unsigned(31 downto 0);
    io_joystick_1 : in unsigned(31 downto 0);
    io_joystick_analog_0 : in unsigned(15 downto 0);
    io_joystick_analog_1 : in unsigned(15 downto 0);
    io_status : in unsigned(31 downto 0);
    io_ioctl_download : in std_logic;
    io_ioctl_index : in std_logic_vector(7 downto 0);
    io_ioctl_wr : in std_logic;
    io_ioctl_addr : in std_logic_vector(24 downto 0);
    io_ioctl_dout : in std_logic_vector(7 downto 0);
    io_ioctl_wait : out std_logic;
    io_audio_l : out unsigned(15 downto 0);
    io_audio_r : out unsigned(15 downto 0);
    clk : in std_logic;
    reset : in std_logic
  );
end chf_core;

architecture arch of chf_core is
  signal zz_14 : std_logic;
  signal zz_15 : std_logic;
  signal zz_16 : std_logic;
  signal zz_17 : std_logic;
  signal zz_18 : std_logic;
  signal zz_19 : unsigned(7 downto 0);
  signal zz_20 : unsigned(7 downto 0);
  signal zz_21 : std_logic;
  signal zz_22 : std_logic;
  signal zz_23 : std_logic;
  signal zz_24 : unsigned(7 downto 0);
  signal zz_25 : unsigned(7 downto 0);
  signal zz_26 : std_logic;
  signal zz_27 : std_logic;
  signal zz_28 : unsigned(7 downto 0);
  signal zz_29 : unsigned(7 downto 0);
  signal zz_30 : std_logic;
  signal zz_31 : std_logic;
  signal zz_32 : unsigned(7 downto 0);
  signal zz_33 : unsigned(7 downto 0);
  signal zz_34 : std_logic;
  signal zz_35 : std_logic;
  signal zz_36 : unsigned(7 downto 0);
  signal zz_37 : unsigned(7 downto 0);
  signal zz_38 : std_logic_vector(0 downto 0);
  signal zz_39 : std_logic_vector(0 downto 0);
  signal zz_40 : std_logic_vector(1 downto 0);
  signal zz_41 : std_logic_vector(7 downto 0);
  signal zz_42 : std_logic_vector(7 downto 0);
  signal zz_43 : std_logic_vector(7 downto 0);
  signal zz_44 : std_logic_vector(2 downto 0);
  signal zz_45 : std_logic_vector(2 downto 0);
  signal zz_46 : std_logic_vector(2 downto 0);
  signal i_cpu_io_dw : unsigned(7 downto 0);
  signal i_cpu_io_dv : std_logic;
  signal i_cpu_io_romc : unsigned(4 downto 0);
  signal i_cpu_io_phase : unsigned(3 downto 0);
  signal i_cpu_io_po_a : unsigned(7 downto 0);
  signal i_cpu_io_po_b : unsigned(7 downto 0);
  signal i_cpu_io_acco : unsigned(7 downto 0);
  signal i_cpu_io_visaro : unsigned(5 downto 0);
  signal i_cpu_io_iozcso : unsigned(4 downto 0);
  signal i_psu0_io_dr : unsigned(7 downto 0);
  signal i_psu0_io_dv : std_logic;
  signal i_psu0_io_int_req : std_logic;
  signal i_psu0_io_pri_o : std_logic;
  signal i_psu0_io_po_a : unsigned(7 downto 0);
  signal i_psu0_io_po_b : unsigned(7 downto 0);
  signal i_psu0_io_pc0o : unsigned(15 downto 0);
  signal i_psu0_io_pc1o : unsigned(15 downto 0);
  signal i_psu0_io_dc0o : unsigned(15 downto 0);
  signal i_psu1_io_dr : unsigned(7 downto 0);
  signal i_psu1_io_dv : std_logic;
  signal i_psu1_io_int_req : std_logic;
  signal i_psu1_io_pri_o : std_logic;
  signal i_psu1_io_po_a : unsigned(7 downto 0);
  signal i_psu1_io_po_b : unsigned(7 downto 0);
  signal i_psu1_io_pc0o : unsigned(15 downto 0);
  signal i_psu1_io_pc1o : unsigned(15 downto 0);
  signal i_psu1_io_dc0o : unsigned(15 downto 0);
  signal i_psu2_io_dr : unsigned(7 downto 0);
  signal i_psu2_io_dv : std_logic;
  signal i_psu2_io_int_req : std_logic;
  signal i_psu2_io_pri_o : std_logic;
  signal i_psu2_io_po_a : unsigned(7 downto 0);
  signal i_psu2_io_po_b : unsigned(7 downto 0);
  signal i_psu2_io_pc0o : unsigned(15 downto 0);
  signal i_psu2_io_pc1o : unsigned(15 downto 0);
  signal i_psu2_io_dc0o : unsigned(15 downto 0);
  signal i_psu3_io_dr : unsigned(7 downto 0);
  signal i_psu3_io_dv : std_logic;
  signal i_psu3_io_int_req : std_logic;
  signal i_psu3_io_pri_o : std_logic;
  signal i_psu3_io_po_a : unsigned(7 downto 0);
  signal i_psu3_io_po_b : unsigned(7 downto 0);
  signal i_psu3_io_pc0o : unsigned(15 downto 0);
  signal i_psu3_io_pc1o : unsigned(15 downto 0);
  signal i_psu3_io_dc0o : unsigned(15 downto 0);
  signal i_psu4_io_dr : unsigned(7 downto 0);
  signal i_psu4_io_dv : std_logic;
  signal i_psu4_io_int_req : std_logic;
  signal i_psu4_io_pri_o : std_logic;
  signal i_psu4_io_po_a : unsigned(7 downto 0);
  signal i_psu4_io_po_b : unsigned(7 downto 0);
  signal i_psu4_io_pc0o : unsigned(15 downto 0);
  signal i_psu4_io_pc1o : unsigned(15 downto 0);
  signal i_psu4_io_dc0o : unsigned(15 downto 0);
  signal i_psu5_io_dr : unsigned(7 downto 0);
  signal i_psu5_io_dv : std_logic;
  signal i_psu5_io_int_req : std_logic;
  signal i_psu5_io_pri_o : std_logic;
  signal i_psu5_io_po_a : unsigned(7 downto 0);
  signal i_psu5_io_po_b : unsigned(7 downto 0);
  signal i_psu5_io_pc0o : unsigned(15 downto 0);
  signal i_psu5_io_pc1o : unsigned(15 downto 0);
  signal i_psu5_io_dc0o : unsigned(15 downto 0);
  signal zz_47 : std_logic_vector(0 downto 0);
  signal zz_48 : std_logic;
  signal zz_49 : std_logic_vector(0 downto 0);
  signal zz_50 : std_logic;
  signal zz_51 : std_logic_vector(1 downto 0);
  attribute ram_style : string;

  signal dr : unsigned(7 downto 0);
  signal romc : unsigned(4 downto 0);
  signal phase : unsigned(3 downto 0);
  signal ce : std_logic;
  signal pi0 : unsigned(7 downto 0);
  signal po0 : unsigned(7 downto 0);
  signal pi1 : unsigned(7 downto 0);
  signal po1 : unsigned(7 downto 0);
  signal pi1i : unsigned(7 downto 0);
  signal pi4 : unsigned(7 downto 0);
  signal po4 : unsigned(7 downto 0);
  signal pi4i : unsigned(7 downto 0);
  signal pi5 : unsigned(7 downto 0);
  signal po5 : unsigned(7 downto 0);
  signal load_a : unsigned(9 downto 0);
  signal load_d : unsigned(7 downto 0);
  signal load_wr0 : std_logic;
  signal load_wr1 : std_logic;
  signal load_wr2 : std_logic;
  signal load_wr3 : std_logic;
  signal tick : std_logic;
  signal reset_na : std_logic;
  signal areset_na : std_logic;
  signal vreset_na : unsigned(15 downto 0);
  signal dc0 : unsigned(15 downto 0);
  signal pc0 : unsigned(15 downto 0);
  signal pc1 : unsigned(15 downto 0);
  signal acc : unsigned(7 downto 0);
  signal visar : unsigned(5 downto 0);
  signal iozcs : unsigned(4 downto 0);
  signal vram_h : unsigned(6 downto 0);
  signal vram_v : unsigned(5 downto 0);
  signal vram_dw : unsigned(1 downto 0);
  signal vram_wr : std_logic;
  signal vram_a : unsigned(12 downto 0);
  signal pos : unsigned(12 downto 0);
  signal p125 : std_logic;
  signal p126 : std_logic;
  signal pix : unsigned(1 downto 0);
  signal hpos : unsigned(7 downto 0);
  signal hposp : unsigned(7 downto 0);
  signal vpos : unsigned(8 downto 0);
  signal vposp : unsigned(8 downto 0);
  signal vga_r : unsigned(7 downto 0);
  signal vga_g : unsigned(7 downto 0);
  signal vga_b : unsigned(7 downto 0);
  signal vga_hs : std_logic;
  signal vga_vs : std_logic;
  signal vga_de : std_logic;
  signal zz_1 : unsigned(5 downto 0);
  signal zz_2 : unsigned(5 downto 0);
  signal zz_7 : unsigned(3 downto 0);
  signal zz_8 : unsigned(2 downto 0);
  signal zz_9 : unsigned(3 downto 0);
  signal zz_10 : unsigned(2 downto 0);
  signal zz_11 : unsigned(3 downto 0);
  signal zz_12 : unsigned(2 downto 0);
  signal rdena : std_logic;
  signal audio_l : unsigned(15 downto 0);
  signal audio_r : unsigned(15 downto 0);
  signal vdiv : unsigned(15 downto 0);
  signal s_v : std_logic;
  signal tone : unsigned(1 downto 0);
  signal zz_13 : std_logic;
  type v125_type is array (0 to 63) of std_logic_vector(0 downto 0);
  signal v125 : v125_type;
  type v126_type is array (0 to 63) of std_logic_vector(0 downto 0);
  signal v126 : v126_type;
  type vram_type is array (0 to 8191) of std_logic_vector(1 downto 0);
  signal vram : vram_type;
  type zz_3_type is array (0 to 7) of std_logic_vector(7 downto 0);
  signal zz_3 : zz_3_type := (
     "00010000","11111101","11111111","00000010","01001011","11100000","10010001","11001110");
  attribute ram_style of zz_3 : signal is "distributed";
  type zz_4_type is array (0 to 7) of std_logic_vector(7 downto 0);
  signal zz_4 : zz_4_type := (
     "00010000","11111101","00110001","11001100","00111111","11100000","11111111","11010000");
  attribute ram_style of zz_4 : signal is "distributed";
  type zz_5_type is array (0 to 7) of std_logic_vector(7 downto 0);
  signal zz_5 : zz_5_type := (
     "00010000","11111101","01010011","01011101","11110011","11100000","10100110","11111111");
  attribute ram_style of zz_5 : signal is "distributed";
  type zz_6_type is array (0 to 15) of std_logic_vector(2 downto 0);
  signal zz_6 : zz_6_type := (
     "000","001","001","001","111","100","010","011","101","100","010","011","110","100","010","011");
  attribute ram_style of zz_6 : signal is "distributed";
begin
  zz_47 <= pkg_toStdLogicVector(pkg_extract(vram_dw,1));
  zz_48 <= (vram_wr and pkg_toStdLogic(vram_h = pkg_unsigned("1111101")));
  zz_49 <= pkg_toStdLogicVector(pkg_extract(vram_dw,1));
  zz_50 <= (vram_wr and pkg_toStdLogic(vram_h = pkg_unsigned("1111110")));
  zz_51 <= std_logic_vector(vram_dw);
  process(clk)
  begin
    if rising_edge(clk) then
      if zz_48 = '1' then
        v125(to_integer(vram_v)) <= zz_47;
      end if;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      if ce = '1' then
        zz_38 <= v125(to_integer(zz_1));
      end if;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      if zz_50 = '1' then
        v126(to_integer(vram_v)) <= zz_49;
      end if;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      if ce = '1' then
        zz_39 <= v126(to_integer(zz_2));
      end if;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      if vram_wr = '1' then
        vram(to_integer(vram_a)) <= zz_51;
      end if;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      if ce = '1' then
        zz_40 <= vram(to_integer(pos));
      end if;
    end if;
  end process;

  zz_41 <= zz_3(to_integer(zz_8));
  zz_42 <= zz_4(to_integer(zz_10));
  zz_43 <= zz_5(to_integer(zz_12));
  zz_44 <= zz_6(to_integer(zz_7));
  zz_45 <= zz_6(to_integer(zz_9));
  zz_46 <= zz_6(to_integer(zz_11));
  i_cpu : entity work.f8_cpu
    port map ( 
      io_dr => dr,
      io_dw => i_cpu_io_dw,
      io_dv => i_cpu_io_dv,
      io_romc => i_cpu_io_romc,
      io_phase => i_cpu_io_phase,
      io_po_a => i_cpu_io_po_a,
      io_pi_a => pi0,
      io_po_b => i_cpu_io_po_b,
      io_pi_b => pi1,
      io_ce => ce,
      io_acco => i_cpu_io_acco,
      io_visaro => i_cpu_io_visaro,
      io_iozcso => i_cpu_io_iozcso,
      io_reset_na => reset_na,
      clk => clk,
      reset => reset 
    );
  i_psu0 : entity work.f8_psu
    port map ( 
      io_dw => dr,
      io_dr => i_psu0_io_dr,
      io_dv => i_psu0_io_dv,
      io_romc => romc,
      io_tick => tick,
      io_phase => phase,
      io_ext_int => zz_14,
      io_int_req => i_psu0_io_int_req,
      io_pri_o => i_psu0_io_pri_o,
      io_pri_i => zz_15,
      io_po_a => i_psu0_io_po_a,
      io_pi_a => pi4,
      io_po_b => i_psu0_io_po_b,
      io_pi_b => pi5,
      io_load_a => load_a,
      io_load_d => load_d,
      io_load_wr => zz_16,
      io_ce => ce,
      io_reset_na => reset_na,
      io_pc0o => i_psu0_io_pc0o,
      io_pc1o => i_psu0_io_pc1o,
      io_dc0o => i_psu0_io_dc0o,
      clk => clk,
      reset => reset 
    );
  i_psu1 : entity work.f8_psu_1
    port map ( 
      io_dw => dr,
      io_dr => i_psu1_io_dr,
      io_dv => i_psu1_io_dv,
      io_romc => romc,
      io_tick => tick,
      io_phase => phase,
      io_ext_int => zz_17,
      io_int_req => i_psu1_io_int_req,
      io_pri_o => i_psu1_io_pri_o,
      io_pri_i => zz_18,
      io_po_a => i_psu1_io_po_a,
      io_pi_a => zz_19,
      io_po_b => i_psu1_io_po_b,
      io_pi_b => zz_20,
      io_load_a => load_a,
      io_load_d => load_d,
      io_load_wr => zz_21,
      io_ce => ce,
      io_reset_na => reset_na,
      io_pc0o => i_psu1_io_pc0o,
      io_pc1o => i_psu1_io_pc1o,
      io_dc0o => i_psu1_io_dc0o,
      clk => clk,
      reset => reset 
    );
  i_psu2 : entity work.f8_psu_2
    port map ( 
      io_dw => dr,
      io_dr => i_psu2_io_dr,
      io_dv => i_psu2_io_dv,
      io_romc => romc,
      io_tick => tick,
      io_phase => phase,
      io_ext_int => zz_22,
      io_int_req => i_psu2_io_int_req,
      io_pri_o => i_psu2_io_pri_o,
      io_pri_i => zz_23,
      io_po_a => i_psu2_io_po_a,
      io_pi_a => zz_24,
      io_po_b => i_psu2_io_po_b,
      io_pi_b => zz_25,
      io_load_a => load_a,
      io_load_d => load_d,
      io_load_wr => load_wr0,
      io_ce => ce,
      io_reset_na => reset_na,
      io_pc0o => i_psu2_io_pc0o,
      io_pc1o => i_psu2_io_pc1o,
      io_dc0o => i_psu2_io_dc0o,
      clk => clk,
      reset => reset 
    );
  i_psu3 : entity work.f8_psu_3
    port map ( 
      io_dw => dr,
      io_dr => i_psu3_io_dr,
      io_dv => i_psu3_io_dv,
      io_romc => romc,
      io_tick => tick,
      io_phase => phase,
      io_ext_int => zz_26,
      io_int_req => i_psu3_io_int_req,
      io_pri_o => i_psu3_io_pri_o,
      io_pri_i => zz_27,
      io_po_a => i_psu3_io_po_a,
      io_pi_a => zz_28,
      io_po_b => i_psu3_io_po_b,
      io_pi_b => zz_29,
      io_load_a => load_a,
      io_load_d => load_d,
      io_load_wr => load_wr1,
      io_ce => ce,
      io_reset_na => reset_na,
      io_pc0o => i_psu3_io_pc0o,
      io_pc1o => i_psu3_io_pc1o,
      io_dc0o => i_psu3_io_dc0o,
      clk => clk,
      reset => reset 
    );
  i_psu4 : entity work.f8_psu_4
    port map ( 
      io_dw => dr,
      io_dr => i_psu4_io_dr,
      io_dv => i_psu4_io_dv,
      io_romc => romc,
      io_tick => tick,
      io_phase => phase,
      io_ext_int => zz_30,
      io_int_req => i_psu4_io_int_req,
      io_pri_o => i_psu4_io_pri_o,
      io_pri_i => zz_31,
      io_po_a => i_psu4_io_po_a,
      io_pi_a => zz_32,
      io_po_b => i_psu4_io_po_b,
      io_pi_b => zz_33,
      io_load_a => load_a,
      io_load_d => load_d,
      io_load_wr => load_wr2,
      io_ce => ce,
      io_reset_na => reset_na,
      io_pc0o => i_psu4_io_pc0o,
      io_pc1o => i_psu4_io_pc1o,
      io_dc0o => i_psu4_io_dc0o,
      clk => clk,
      reset => reset 
    );
  i_psu5 : entity work.f8_psu_5
    port map ( 
      io_dw => dr,
      io_dr => i_psu5_io_dr,
      io_dv => i_psu5_io_dv,
      io_romc => romc,
      io_tick => tick,
      io_phase => phase,
      io_ext_int => zz_34,
      io_int_req => i_psu5_io_int_req,
      io_pri_o => i_psu5_io_pri_o,
      io_pri_i => zz_35,
      io_po_a => i_psu5_io_po_a,
      io_pi_a => zz_36,
      io_po_b => i_psu5_io_po_b,
      io_pi_b => zz_37,
      io_load_a => load_a,
      io_load_d => load_d,
      io_load_wr => load_wr3,
      io_ce => ce,
      io_reset_na => reset_na,
      io_pc0o => i_psu5_io_pc0o,
      io_pc1o => i_psu5_io_pc1o,
      io_dc0o => i_psu5_io_dc0o,
      clk => clk,
      reset => reset 
    );
  ce <= pkg_toStdLogic(true);
  io_vga_ce <= ce;
  romc <= i_cpu_io_romc;
  phase <= i_cpu_io_phase;
  po0 <= i_cpu_io_po_a;
  po1 <= i_cpu_io_po_b;
  acc <= i_cpu_io_acco;
  visar <= i_cpu_io_visaro;
  iozcs <= i_cpu_io_iozcso;
  zz_14 <= pkg_toStdLogic(false);
  po4 <= i_psu0_io_po_a;
  po5 <= i_psu0_io_po_b;
  zz_15 <= pkg_toStdLogic(true);
  zz_16 <= pkg_toStdLogic(false);
  pc0 <= i_psu0_io_pc0o;
  pc1 <= i_psu0_io_pc1o;
  dc0 <= i_psu0_io_dc0o;
  zz_17 <= pkg_toStdLogic(false);
  zz_19 <= pkg_unsigned("11111111");
  zz_20 <= pkg_unsigned("11111111");
  zz_18 <= pkg_toStdLogic(true);
  zz_21 <= pkg_toStdLogic(false);
  zz_22 <= pkg_toStdLogic(false);
  zz_24 <= pkg_unsigned("11111111");
  zz_25 <= pkg_unsigned("11111111");
  zz_23 <= pkg_toStdLogic(true);
  zz_26 <= pkg_toStdLogic(false);
  zz_28 <= pkg_unsigned("11111111");
  zz_29 <= pkg_unsigned("11111111");
  zz_27 <= pkg_toStdLogic(true);
  zz_30 <= pkg_toStdLogic(false);
  zz_32 <= pkg_unsigned("11111111");
  zz_33 <= pkg_unsigned("11111111");
  zz_31 <= pkg_toStdLogic(true);
  zz_34 <= pkg_toStdLogic(false);
  zz_36 <= pkg_unsigned("11111111");
  zz_37 <= pkg_unsigned("11111111");
  zz_35 <= pkg_toStdLogic(true);
  process(i_psu0_io_dv,i_psu0_io_dr,i_psu1_io_dv,i_psu1_io_dr,i_psu2_io_dv,i_psu2_io_dr,i_psu3_io_dv,i_psu3_io_dr,i_psu4_io_dv,i_psu4_io_dr,i_psu5_io_dv,i_psu5_io_dr,i_cpu_io_dw)
  begin
    if i_psu0_io_dv = '1' then
      dr <= i_psu0_io_dr;
    else
      if i_psu1_io_dv = '1' then
        dr <= i_psu1_io_dr;
      else
        if i_psu2_io_dv = '1' then
          dr <= i_psu2_io_dr;
        else
          if i_psu3_io_dv = '1' then
            dr <= i_psu3_io_dr;
          else
            if i_psu4_io_dv = '1' then
              dr <= i_psu4_io_dr;
            else
              if i_psu5_io_dv = '1' then
                dr <= i_psu5_io_dr;
              else
                dr <= i_cpu_io_dw;
              end if;
            end if;
          end if;
        end if;
      end if;
    end if;
  end process;

  io_ioctl_wait <= pkg_toStdLogic(false);
  vram_h <= pkg_not(pkg_extract(po4,6,0));
  vram_v <= pkg_not(pkg_extract(po5,5,0));
  vram_dw <= pkg_not(pkg_extract(po1,7,6));
  vram_wr <= pkg_extract(po0,5);
  vram_a <= pkg_resize((pkg_resize(vram_h,14) + (vram_v * pkg_unsigned("10000000"))),13);
  pix <= unsigned(zz_40);
  zz_1 <= pkg_extract(vposp,7,2);
  p125 <= pkg_extract(zz_38,0);
  zz_2 <= pkg_extract(vposp,7,2);
  p126 <= pkg_extract(zz_39,0);
  zz_7 <= unsigned(pkg_cat(std_logic_vector(unsigned(pkg_cat(std_logic_vector(unsigned(pkg_toStdLogicVector(p125))),pkg_toStdLogicVector(p126)))),std_logic_vector(pix)));
  zz_8 <= unsigned(zz_44);
  zz_9 <= unsigned(pkg_cat(std_logic_vector(unsigned(pkg_cat(std_logic_vector(unsigned(pkg_toStdLogicVector(p125))),pkg_toStdLogicVector(p126)))),std_logic_vector(pix)));
  zz_10 <= unsigned(zz_45);
  zz_11 <= unsigned(pkg_cat(std_logic_vector(unsigned(pkg_cat(std_logic_vector(unsigned(pkg_toStdLogicVector(p125))),pkg_toStdLogicVector(p126)))),std_logic_vector(pix)));
  zz_12 <= unsigned(zz_46);
  io_vga_r <= vga_r;
  io_vga_g <= vga_g;
  io_vga_b <= vga_b;
  io_vga_hs <= vga_hs;
  io_vga_vs <= vga_vs;
  io_vga_de <= vga_de;
  process(po0,io_joystick_0,io_joystick_1)
  begin
    pi0(7 downto 4) <= pkg_extract(po0,7,4);
    pi0(0) <= (not (pkg_extract(io_joystick_0,4) or pkg_extract(io_joystick_1,4)));
    pi0(1) <= (not (pkg_extract(io_joystick_0,5) or pkg_extract(io_joystick_1,5)));
    pi0(2) <= (not (pkg_extract(io_joystick_0,6) or pkg_extract(io_joystick_1,6)));
    pi0(3) <= (not (pkg_extract(io_joystick_0,7) or pkg_extract(io_joystick_1,7)));
  end process;

  process(io_joystick_0)
  begin
    pi1i(7) <= (not pkg_extract(io_joystick_0,8));
    pi1i(6) <= (not pkg_extract(io_joystick_0,9));
    pi1i(5) <= (not pkg_extract(io_joystick_0,10));
    pi1i(4) <= (not pkg_extract(io_joystick_0,11));
    pi1i(3) <= (not pkg_extract(io_joystick_0,3));
    pi1i(2) <= (not pkg_extract(io_joystick_0,2));
    pi1i(1) <= (not pkg_extract(io_joystick_0,1));
    pi1i(0) <= (not pkg_extract(io_joystick_0,0));
  end process;

  process(io_joystick_1)
  begin
    pi4i(7) <= (not pkg_extract(io_joystick_1,8));
    pi4i(6) <= (not pkg_extract(io_joystick_1,9));
    pi4i(5) <= (not pkg_extract(io_joystick_1,10));
    pi4i(4) <= (not pkg_extract(io_joystick_1,11));
    pi4i(3) <= (not pkg_extract(io_joystick_1,3));
    pi4i(2) <= (not pkg_extract(io_joystick_1,2));
    pi4i(1) <= (not pkg_extract(io_joystick_1,1));
    pi4i(0) <= (not pkg_extract(io_joystick_1,0));
  end process;

  rdena <= (not pkg_extract(po0,6));
  pi1 <= pkg_mux(rdena,(pi1i or po1),po1);
  pi4 <= pkg_mux(rdena,(pi4i or po4),po4);
  pi5 <= po5;
  io_audio_l <= audio_l;
  io_audio_r <= audio_r;
  tone <= pkg_extract(po5,7,6);
  process(tone,vdiv)
  begin
    case tone is
      when "00" =>
        zz_13 <= pkg_toStdLogic(false);
      when "01" =>
        zz_13 <= pkg_extract(vdiv,10);
      when "10" =>
        zz_13 <= pkg_extract(vdiv,9);
      when others =>
        zz_13 <= pkg_extract(vdiv,7);
    end case;
  end process;

  s_v <= zz_13;
  areset_na <= (((not io_reset) and io_pll_locked) and (not io_ioctl_download));
  reset_na <= pkg_extract(vreset_na,15);
  process(clk)
  begin
    if rising_edge(clk) then
      load_a <= unsigned(pkg_extract(io_ioctl_addr,9,0));
      load_wr0 <= (((not pkg_extract(io_ioctl_addr,10)) and (not pkg_extract(io_ioctl_addr,11))) and io_ioctl_wr);
      load_wr1 <= ((pkg_extract(io_ioctl_addr,10) and (not pkg_extract(io_ioctl_addr,11))) and io_ioctl_wr);
      load_wr2 <= (((not pkg_extract(io_ioctl_addr,10)) and pkg_extract(io_ioctl_addr,11)) and io_ioctl_wr);
      load_wr3 <= ((pkg_extract(io_ioctl_addr,10) and pkg_extract(io_ioctl_addr,11)) and io_ioctl_wr);
      load_d <= unsigned(io_ioctl_dout);
      if ce = '1' then
        hpos <= (hpos + pkg_unsigned("00000001"));
        if pkg_toStdLogic(hpos = pkg_unsigned("11100011")) = '1' then
          hpos <= pkg_unsigned("00000000");
          vpos <= (vpos + pkg_unsigned("000000001"));
          if pkg_toStdLogic(vpos = pkg_unsigned("100000101")) = '1' then
            vpos <= pkg_unsigned("000000000");
          end if;
        end if;
        pos <= (unsigned(pkg_cat(std_logic_vector(pkg_extract(vpos,7,2)),std_logic_vector(pkg_unsigned("0000000")))) + pkg_resize(pkg_extract(hpos,7,1),13));
        vposp <= vpos;
        hposp <= hpos;
        vga_r <= unsigned(zz_41);
        vga_g <= unsigned(zz_42);
        vga_b <= unsigned(zz_43);
        vga_de <= (pkg_toStdLogic(vposp <= pkg_unsigned("011101000")) and pkg_toStdLogic(hposp < pkg_unsigned("11010000")));
        vga_hs <= (pkg_toStdLogic(pkg_unsigned("11010100") <= hposp) and pkg_toStdLogic(hposp <= pkg_unsigned("11011100")));
        vga_vs <= (pkg_toStdLogic(pkg_unsigned("011110010") <= vposp) and pkg_toStdLogic(vposp <= pkg_unsigned("011110110")));
      end if;
      vdiv <= (vdiv + pkg_unsigned("0000000000000001"));
      audio_l <= pkg_mux(s_v,pkg_unsigned("1111111111111111"),pkg_unsigned("0000000000000000"));
      audio_r <= pkg_mux(s_v,pkg_unsigned("1111111111111111"),pkg_unsigned("0000000000000000"));
      if (not areset_na) = '1' then
        vreset_na <= pkg_unsigned("0000000000000000");
      else
        vreset_na <= unsigned(pkg_cat(std_logic_vector(pkg_extract(vreset_na,14,0)),std_logic_vector(pkg_unsigned("1"))));
      end if;
    end if;
  end process;

end arch;

