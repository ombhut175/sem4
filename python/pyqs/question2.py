import matplotlib.pyplot as plt

mon = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"]
visiters = [11000, 12000, 15000, 12500, 25000, 17000]
bars = plt.bar(mon, visiters, width=0.5)
for i in bars:
    yc = i.get_height()
    plt.text(i.get_x(), yc+100, f"{yc}")
plt.show()