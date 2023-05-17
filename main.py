from math import*

csteIncid=1
cstRefl=1
temps={1/1000, 1/500, 1/250, 1/125, 1/60, 1/30, 1/15, 1/8, 1/4, 1/2, 1}
ouverture={16, 11, 8, 5.6, 4, 2.8, 2}
def main():
    lux=int(input("Quantité de lumière en Lux ? (Mesure lumière incidente) "))
    luminance=int(input("\nValeur de la luminance ? (Mesure lumière réfléchie) "))
    iso=int(input("\nVitesse de la pellicule ? (En ISO) "))
    vit2ouvIncid=(lux*iso)/csteIncid
    vit2ouvRefl=(luminance*iso)/cstRefl
    print("\nValeur en lumière incidente : ",vit2ouvIncid,".\nValeur en lumière réfléchie : ",vit2ouvRefl,".",sep='')

main()