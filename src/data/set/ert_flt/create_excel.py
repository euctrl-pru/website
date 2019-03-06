from openpyxl import Workbook
from openpyxl.compat import range
from openpyxl.cell import get_column_letter
import csv

wb = Workbook()

dest_filename = 'empty_book.xlsx'

ws1 = wb.active
ws1.title = "ERT_FLT"

with open('En-Route_Traffic.csv') as csvfile:
    rdr = csv.reader(csvfile, delimiter=',', quotechar='"')
    for row in rdr:
        ws1.append(row)

wb.save(filename = dest_filename)
