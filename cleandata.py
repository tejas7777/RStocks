import csv


data = []

with open('NFLX.csv', 'r') as file:
    reader = csv.reader(file)
    count =0
    for row in reader:
        if count>0:
            if row[1][0] == "$":
                row[1] = row[1][1:]
            if row[3][0] == "$":
                row[3] = row[3][1:]

            if row[4][0] == "$":
                row[4] = row[4][1:]
        
            if row[5][0] == "$":
                row[5] = row[5][1:]
            
        data.append(row)
        count = count + 1

    out = csv.writer(open("NFLX-out.csv","w"), delimiter=',')
    for row in data:
        out.writerow(row)

    

