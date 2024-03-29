# %%
# add, sub, and, or, srl, slt, addiu
rtype = {
    "add": 32,
    "sub": 34,
    "and": 36,
    "or": 37,
    "slt": 42,
    "srl": 2,
    "multu": 25,
    "maddu": 4,
    "mvhi": 16,
    "mvlo": 18,
}
itype = {"lw": 35, "sw": 43, "beq": 4, "addiu": 9}


register_table = {
    "": 0,
    "$zero": 0,
    "$at": 1,
    "$v0": 2,
    "$v1": 3,
    "$a0": 4,
    "$a1": 5,
    "$a2": 6,
    "$a3": 7,
    "$t0": 8,
    "$t1": 9,
    "$t2": 10,
    "$t3": 11,
    "$t4": 12,
    "$t5": 13,
    "$t6": 14,
    "$t7": 15,
    "$s0": 16,
    "$s1": 17,
    "$s2": 18,
    "$s3": 19,
    "$s4": 20,
    "$s5": 21,
    "$s6": 22,
    "$s7": 23,
    "$t8": 24,
    "$t9": 25,
    "$k0": 26,
    "$k1": 27,
    "$gp": 28,
    "$sp": 29,
    "$fp": 30,
    "$ra": 31,
    "$0": 0,
    "$1": 1,
    "$2": 2,
    "$3": 3,
    "$4": 4,
    "$5": 5,
    "$6": 6,
    "$7": 7,
    "$8": 8,
    "$9": 9,
    "$10": 10,
    "$11": 11,
    "$12": 12,
    "$13": 13,
    "$14": 14,
    "$15": 15,
    "$16": 16,
    "$17": 17,
    "$18": 18,
    "$19": 19,
    "$20": 20,
    "$21": 21,
    "$22": 22,
    "$23": 23,
    "$24": 24,
    "$25": 25,
    "$26": 26,
    "$27": 27,
    "$28": 28,
    "$29": 29,
    "$30": 30,
    "$31": 31,
    "0": 0,
    "1": 1,
    "2": 2,
    "3": 3,
    "4": 4,
    "5": 5,
    "6": 6,
    "7": 7,
    "8": 8,
    "9": 9,
    "10": 10,
    "11": 11,
    "12": 12,
    "13": 13,
    "14": 14,
    "15": 15,
    "16": 16,
    "17": 17,
    "18": 18,
    "19": 19,
    "20": 20,
    "21": 21,
    "22": 22,
    "23": 23,
    "24": 24,
    "25": 25,
    "26": 26,
    "27": 27,
    "28": 28,
    "29": 29,
    "30": 30,
    "31": 31,
}


# lw $s1, $t7, 0
# add $s2, $s0, $s2
def gen(ins):
    total = 0
    rs = ""
    rt = ""
    rd = ""
    i = 0
    op = ""
    while i < len(ins) and ins[i] != " ":
        op += ins[i]
        i = i + 1
    i = i + 1  # skip space
    if op in rtype:
        if op != "maddu" and op != "multu":
            while i < len(ins) and ins[i] != ",":
                rd += ins[i]
                i = i + 1
            i = i + 2  # skip comma

        while i < len(ins) and ins[i] != ",":
            rs += ins[i]
            i = i + 1
        i = i + 2  # skip comma

        while i < len(ins) and ins[i] != ",":
            rt += ins[i]
            i = i + 1
        # print("rtype:" + op + ":" + rs + ":" + rt + ":" + rd + ":")
        rs = register_table[rs]
        rt = register_table[rt]
        rd = register_table[rd]
        # rs, rt, rd = rd, rs, rt
        total = rs * (2**21) + rt * (2**16) + rd * (2**11) + rtype[op]
        if op == "maddu":
            total = total + 28 * (2**26)
        return total

    if op in itype:
        imm = ""
        while i < len(ins) and ins[i] != ",":
            rs += ins[i]
            i = i + 1
        i = i + 2  # skip comma
        while i < len(ins) and ins[i] != ",":
            rt += ins[i]
            i = i + 1
        i = i + 2  # skip comma
        while i < len(ins) and ins[i] != ",":
            imm += ins[i]
            i = i + 1

        # print("rtype:" + op + ":" + rs + ":" + rt + ":" + rd + ":")
        rs = register_table[rs]
        rt = register_table[rt]

        if op in ["lw", "sw"]:
            rs, rt = rt, rs
        total = itype[op] * (2**26) + rs * (2**21) + rt * (2**16) + int(imm)
        return total

    if op == "j":
        return 2 * 2**26 + int(ins[1 : len(ins)])
    if op == "none":
        return 0


# %%
out = open("instr_mem.txt", "w")
inn = open("instr.txt", "r")

ins = inn.readline()
while ins:
    print(ins)
    if ins[len(ins) - 1] == "\n":
        ins = ins[0 : len(ins) - 1]
    out.write(f"//instruction: >>{ins}<<\n")
    s = str(hex(gen(ins)))
    s = s[2 : len(s)]
    while len(s) < 8:
        s = "0" + s

    s = s.upper()

    out.write(s[6] + s[7])
    out.write("\n")
    out.write(s[4] + s[5])
    out.write("\n")
    out.write(s[2] + s[3])
    out.write("\n")
    out.write(s[0] + s[1])
    out.write("\n")
    ins = inn.readline()
out.close()
print("done!!!!")


# %%
