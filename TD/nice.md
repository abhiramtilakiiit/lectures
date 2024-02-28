# Thermodynamic interpretation of $T_{uc}$.

As a result, for $\xi > 2$. We have 

$$ \Delta_{mix}G = nRT(x_alnx_a + x_blnx_b + \xi x_ax_b) $$

Use $x_a = 1 - x_b$ and then differentiate and equate to zero.

Just like upper critical temp, there is also lower critical temp (T_{lc})

Eg: Water and triethylamine.

This means by default they are miscible but heating up will break the complexes 
they make, making them immiscible.

Eg: water and nicotine have both $T_{uc}$ and $T_{lc}$

## Eutectic

Boiling before $T_{uc}$ reaches so boiling (vapour) changing starts before mixing.
This when in solids is called Eutectics. That means the melting point of combined is less than
that of each of the solids ( solder - Lead and tin ).

Chemical Potential of a real solvent in terms of activity:

$$ \mu_a = \mu*_a + RTlnx_a + RTln\gamma_a$$

Here gamma is the deviation from ideal behaviour for given solvent.

Activity can be given as
$$ a_j = \gamma_j \frac{b_j}{b_j^{\circ}}$$

### Activity of solvents and solutes

For pure solid or liquid, $a = 1$ ( thus pH = -1 is wrong )

For solvent Raoult's law is used to find the stuff. $a = \frac{p}{p*}$.
dd
For solute Henry's law is used to get $a = \frac{p}{K_b}$

But in general we can use activity coefficient instead and get.

### Biological standard state

Standandard state and biological standard state (pH=7), differ by 40kJ/mol

### Equillibrium

Change in reaction Gibbs free energy = $\left( \frac{\partial G}{\partial \xi} \right)_{p,T} = \mu_P - \mu_R$. Now using the above activity definitions.

$$ \Delta_r G = \Delta_r G^{\circ} + RT ln Q$$

LHS is zero when in equillibrium. ( And Q at equillibrium is called K )

Where $$ Q = \frac{a_p^{n_p}}{a_r^{n_r}} $$, remember that $\xi$ is based on number of moles. If $n_r = - v_r$ we can get. $$ Q = \Pi_j a_j^{\nu_j} $$

### Biology shit

It takes 12 mole of glucose to get small protein like myoglobin.

### Boltzmann shit


### Electrochemistry

In dissolution of HCl you get
$$ \Delta_r G^{\circ} =  \Delta_f G^{\circ} (Cl-) $$

Like this finding gibbs free energy by dissolving compounds in natural
state can help us find chemical potential of ions.

Here the free energy has a special definition
$$ \Delta G = non pV work $$
Electrical work of transfering an ion from vacuum to solvent.

## Mean activity coefficientk

WKT for $A_pB_q$,
$$ G_m = G_m^{\circ} + pRT ln \gamma_a + qRT ln \gamma_b $$

We define mean activity coefficient as:

$$ \gamma_{\pm} = \left[ \gamma_+^p \gamma_-^q \right]^{\frac{1}{p+q}} $$

This makes both ions have equal contribution.

## Debye Huckel limiting Law

Somehow found ou tthe mean activity coefficient depends on chargess
$$ ln \gamma_{\pm} = - A |product of charges| \sqrt{I} $$

Where I is,
$$ I = \frac{1}{2} \Sigma_i z_i^2 \frac{b_i}{b^{\circ}}  $$
(this is actually linear since b for each is z opp dependent in most salts)

In reality there is a small deviation, corrected by extended debye huckel 
$$ log \gamma_\pm = - \frac{|z_+z_- A\sqrt{I}|}{1 + B\sqrt{I}} + C.I $$

## Electrical work

WKT,
$$ RT ln \gamma_{\pm} = w_{electrical}  $$
$$ ln \gamma_{\pm} = \frac{w_{electrical}}{(p+q)RT}  $$

## Using Boltzmann probability

WKT: 
$$ \phi_i = z_i/r e^{\frac{-r}{r_d}} $$

To find $r_d$ we use guass laws:

$$ \frac{1}{r^2}\frac{d}{dr}(r^2\frac{d\phi}{dr}) = -\frac{\rho}{\epsilon} $$

by estimation we get:
$$ r^2_D = - \frac{\epsilon \phi_i}{\rho_i} $$

To relate $\rho$ with $\phi$ we use boltzmann distribtion of charge.

Energy of single charge is 
$$ E = z_i e\phi_i $$
which keeps decreasing thus, with concentration
$$ \frac{c_j}{c_j^{\circ} } = e^{- \frac{z_je\phi_i}{RT}} $$

Using this to find total charge:
$$ \rho_i = c_+z_+F + c_-z_-F $$
and expanding power and estimating upto 2 degree term we get:

$$ \rho_i = (c_+^{\circ}z_+ + c_-^{\circ}z_-) +  (c_+^{\circ}z_+^2 + c_-^{\circ}z_-^2) \frac{e\phi_i}{RT}  $$
Since the first part in bulk the value is zero we get

Using $ c = b\rho$ and debye equation
$$ \rho_i = - \frac{2Ib^{\circ}\rho F^2 \phi_i}{RT} $$

$$ r_D = \sqrt{\frac{\epsilon RT}{2Ib^{\circ}\rho F^2}} $$

## Nerst Equation

WKT, when $d\xi$ equation proceeds forward the work done is,
$$ W = - N_a\nu ed\xi E$$
Where E is the electric field.

Similarly for this small change wkt
$$ \frac{\partial G}{\partial \xi} = \Delta_r G $$

thus non-pv $W = \partial G$,

$$ \Delta_r G = - EF\nu  $$

Using that in the equillibrium constant equation.

$$ E = E^{\circ} - \frac{RT}{\nu F}ln Q $$
$$ E = E^{\circ} - \frac{59.2 mV}{\nu} ln Q $$

Used to determine pH by finding out Standard EMF.

Differentiate by T you get entropy