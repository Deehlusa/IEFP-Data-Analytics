# Criar uma classe pai Funcionario com atr nome e salario_base
# Adiciona o metodo calcular_salario() que devolve salario_base
# Criar uma classe Filha Gerente que herda de Funcionario. Adiciona atr proprio bonus.
# Sobrescreve. o metodo calcular_salario() na classe Gerente usando super() para devolver. o salario base acrescido bónus
# Cria uma classe filha Vendedor que herda Funcionario. Adiciona os atributos vendas e comissao_pct (ex: 0.10 para 10%)
# Sobscreve calcular_salario() adicionando a comissão sobre as vendas ao sálario.

# Funcionario é a classe PAI. Não herda de ninguém, por isso os parênteses ficam vazios.
class Funcionario():
# __init__ recebe os dados ao criar o objeto e guarda-os em self (self = o funcionário concreto, ex.: o Rui).
    def __init__(self, nome, salario_base):
        self.nome = nome
        self.salario_base = salario_base

# calcular_salario devolve só o salário base. As classes filhas vão reaproveitar este método com super().
    def calcular_salario(self):
        return self.salario_base
    
# Gerente é classe FILHA: Funcionario entre parênteses quer dizer que herda tudo o que o Funcionario tem.
class Gerente(Funcionario):
# super().__init__ entrega o nome e o salario_base ao pai, que já sabe guardá-los.
# Aqui só se guarda o que é novo no Gerente: o bonus.
    def __init__(self, nome, bonus, salario_base):
        super().__init__(nome, salario_base)
        self.bonus = bonus

# Sobrescreve o calcular_salario do pai (mesmo nome = substitui).
# super().calcular_salario() devolve o salário base do pai e soma-se o bonus. Ex.: 1500 + 300 = 1800
    def calcular_salario(self):
        return super().calcular_salario() + self.bonus

# Vendedor é outra classe FILHA de Funcionario. Não tem bonus; tem vendas e comissao_pct.
class Vendedor(Funcionario):
# Mesma ideia do Gerente: nome e salario_base vão para o pai, vendas e comissao_pct ficam guardados aqui.
# O __init__ só GUARDA os valores como vêm; as contas ficam no calcular_salario.
    def __init__(self, nome, salario_base, vendas, comissao_pct):
        super().__init__(nome, salario_base)
        self.vendas = vendas
        self.comissao_pct = comissao_pct

# Sobrescreve o calcular_salario: salário base do pai + comissão (vendas x percentagem).
# O Python multiplica antes de somar. Ex.: 1000 + 5000 * 0.10 = 1000 + 500 = 1500.0
    def calcular_salario(self):
        return super().calcular_salario() + self.vendas * self.comissao_pct


# Criar um objeto de cada classe. Os valores vão pela ordem dos parâmetros do __init__ de cada classe.
f = Funcionario("Rui", 1000)               # nome, salario_base
g = Gerente("Ana", 300, 1500)              # nome, bonus, salario_base
v = Vendedor("Eva", 1000, 5000, 0.10)      # nome, salario_base, vendas, comissao_pct

# Polimorfismo: a mesma chamada func.calcular_salario() para todos, mas cada objeto usa a versão da sua classe.
# Rui -> Funcionario (1000) | Ana -> Gerente (1800) | Eva -> Vendedor (1500.0)
funcionarios = [f, g, v]

for func in funcionarios:
    print(func.nome, func.calcular_salario())
