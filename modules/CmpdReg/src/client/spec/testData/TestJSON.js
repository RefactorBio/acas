$(function () {


	window.testJSON = {
        saltForm: {
            id: 1,
            corpName: "SGD-1234-C14Na",
            chemist:{"id":2, "code": "cchemist", "name": "Corey Chemist","isChemist":true,"isAdmin":false},
            "isosalts":[
                {"id":2, "iosotope":{id: 4, "name":"istn1","abbrev":"ista1","massChange":1},"equivalents":1.7,"type":"isotope"},
                {"id":3, "salt":{id: 5, "name":"isn1","abbrev":"isa1","molStructure":"mol string 1"},"equivalents":2.7,"type":"salt"}
                ],
            "casNumber":"12345",
            "molStructure": "\n  Marvin  09141115532D          \n\n  2  1  0  0  0  0            999 V2000\n    0.8250    0.0000    0.0000 C   0  0  0  0  0  0  0  0  0  0  0  0\n    0.0000    0.0000    0.0000 C   0  0  0  0  0  0  0  0  0  0  0  0\n  1  2  4  0  0  0  0\nM  END\n$$$$\n"
        },

        fileList: [
            {"description":"this is file 1","uploaded":true,"name":"file1.txt","size":23,"type":"text/plain", "url":"uploads/1111-223/file1.txt"},
            {"description":"this is file 2","uploaded":true,"name":"file2.txt","size":54,"type":"text/plain", "url":"uploads/1111-223/file2.txt"},
            {"description":"this is file 3","uploaded":false,"name":"file3.txt","size":34,"type":"text/plain", "url":"uploads/1111-223/file3.txt"}
        ],

        lot:  {
            id: 1,
            corpName: 'SGD-1234-C14Na-02',
            notebookPage: '1234-043',
            chemist:{"id":2, "code": "cchemist", "name": "Corey Chemist","isChemist":true,"isAdmin":false},
            project:{"code":"project3","id":3,"name":"Project 3","version":0},
            synthesisDate: '10/24/2011',
            color: 'blue',
            amountUnits: {"id":4, "code": "mL", "name": "mL"},
            solutionAmountUnits: {"id":1, "code": "mL", "name": "mL"},
            vendor: {"id":1, "code": "Araxes", "name": "Araxes"},
            retainUnits: {"id":4, "code": "mL", "name": "mL"},
            physicalState: {"id":3, "code": "gel", "name": "gel"},
            purityMeasuredBy: {"id":1, "code": "HPLC", "name": "HPLC"},
	        "percentEEOperator":{"id":3, "code": ">", "name": ">"},
            purityOperator: {"id":3, "code": ">", "name": ">"},
            registrationDate:"09/14/2012",
            barcode: "V12345",
            fileList: [
                {"description":"this is file 1","uploaded":true,"name":"file1.txt","size":23,"type":"text/plain", "url":"uploads/1111-223/file1.txt"},
                {"description":"this is file 2","uploaded":true,"name":"file2.txt","size":54,"type":"text/plain", "url":"uploads/1111-223/file2.txt"},
                {"description":"this is file 3","uploaded":false,"name":"file3.txt","size":34,"type":"text/plain", "url":"uploads/1111-223/file3.txt"}
            ]
        },
        
        parent: {
            id: 1,
            corpName: 'cName',
            stereoCategory: {"id":1, "code": "scalemic", "name": "Scalemic"},
            chemist:{"id":2, "code": "cchemist", "name": "Corey Chemist","isChemist":true,"isAdmin":false},
            stereoComment: "comment",
            molWeight: 42.42345,
            molFormula: "C2H6",
            commonName: 'common name',
            molStructure: "\n  Marvin  09141115532D          \n\n  2  1  0  0  0  0            999 V2000\n    0.8250    0.0000    0.0000 C   0  0  0  0  0  0  0  0  0  0  0  0\n    0.0000    0.0000    0.0000 C   0  0  0  0  0  0  0  0  0  0  0  0\n  1  2  4  0  0  0  0\nM  END\n$$$$\n"
        },
        adminUser: {"id":1, "code": "aadmin", "name": "Adam Admin","isChemist":false,"isAdmin":true},
        chemistUser: {"id":2, "code": "cchemist", "name": "Corey Chemist","isChemist":true,"isAdmin":false},
        davechemistUser: {"code":"dchemist","id":4,"ignore":null,"isAdmin":false,"isChemist":true,"name":"Dave Chemist","version":0},
        chemist2User: {"id":4, "code": "jchemist", "name": "Joe Chemist","isChemist":true,"isAdmin":false},
        biologistUser: {"id":3, "code": "bbiologist", "name": "Ben Biologist","isChemist":false,"isAdmin":false},

        mol: {
             molStructure: "\n  Marvin  09141115532D          \n\n  2  1  0  0  0  0            999 V2000\n    0.8250    0.0000    0.0000 C   0  0  0  0  0  0  0  0  0  0  0  0\n    0.0000    0.0000    0.0000 C   0  0  0  0  0  0  0  0  0  0  0  0\n  1  2  4  0  0  0  0\nM  END\n$$$$\n"
        },
        molCl: '\n  Marvin  09261116302D          \n\n  1  0  0  0  0  0            999 V2000\n    0.0000    0.0000    0.0000 Cl  0  0  0  0  0  0  0  0  0  0  0  0\nM  END\n$$$$\n',
        molNa: '\n  Marvin  09261116332D          \n\n  2  1  0  0  0  0            999 V2000\n    0.8250    0.0000    0.0000 N   0  0  0  0  0  0  0  0  0  0  0  0\n    0.0000    0.0000    0.0000 A   0  0  0  0  0  0  0  0  0  0  0  0\n  1  2  1  0  0  0  0\nM  MRV SMA   1 [#7;A]\nM  MRV SMA   2 [a;a]\nM  END\n$$$$\n',
        
        metaLot: {
            lot:{
                "id": "1",
                "isVirtual":false,
                "chemist":{"id":2, "code": "cchemist", "name": "Corey Chemist","isChemist":true,"isAdmin":false},
                "project":{"code":"project3","id":3,"name":"Project 3","version":0},
                "corpName":"SGD-1234-C14Na-1",
                "asDrawnStruct":null,
                "lotMolWeight":"",
                "synthesisDate":"10/24/2011",
                "registrationDate":"09/14/2012",
                "color":"blue",
                "physicalState":{"id":3, "code": "gel", "name": "gel"},
                "notebookPage":"1111-223",
                "amount":"42",
                "amountUnits":{"id":1, "code": "mg", "name": "mg"},
	            "solutionAmountUnits": {"id":1, "code": "mL", "name": "mL"},
	            "vendor": {"id":1, "code": "Araxes", "name": "Araxes"},
                "retain":"2",
                "retainUnits":{"id":2, "code": "g", "name": "g"},
                "supplier":"jmco",
                "supplierID":"jmco1111",
                "purity":"92",
                "purityMeasuredBy":{"id":2, "code": "NMR", "name": "NMR"},
                "percentEEOperator":{"id":3, "code": ">", "name": ">"},
                "purityOperator":{"id":3, "code": ">", "name": ">"},
                "percentEE":"42",
                "comments":"i like it",
                "saltForm":{
                    "chemist":{"id":2, "code": "cchemist", "name": "Corey Chemist","isChemist":true,"isAdmin":false},
                    "corpName":"SGD-0001-C14Na",
                    "casNumber":"00010000",
                    "id":1,
                    "molStructure":"\n  Marvin  09141115532D          \n\n  2  1  0  0  0  0            999 V2000\n    0.8250    0.0000    0.0000 C   0  0  0  0  0  0  0  0  0  0  0  0\n    0.0000    0.0000    0.0000 C   0  0  0  0  0  0  0  0  0  0  0  0\n  1  2  4  0  0  0  0\nM  END\n$$$$\n",
                    "parent":{
                        "stereoCategoryCode":"scalemic",
                        "stereoComment":"comment",
                        "commonName":"comname",
	                    "molWeight": 42.42345,
	                    "molFormula": "C2H6",
                       "molStructure":"CC[C@H](C)C(CCCCCCNC(C)(C)OC(=O)OC(=O)OC(C)(C)C)[C@@H](CC(=O)C1=C(C(C)C)C(CCC[C@@H](CC2=CC=CC=C2)C(=O)OC)=CC=C1)OC",
                        "corpName":"SGD-0001",
                        "id":1,
                        "chemist":{"id":2, "code": "cchemist", "name": "Corey Chemist","isChemist":true,"isAdmin":false}
                    }
                }
            },
            isosalts:[   
                {
                    "isotope":{"name":"C14","abbrev":"C14","massChange":2,"id":1},
                    "equivalents":1,
                    "type":"isotope",
                    "id":1
                },
                {
                    "salt":{"name":"Na","abbrev":"Na","molStructure":"mol string 1","id":2},
                    "equivalents":2,
                    "type":"salt",
                    "id":2
                }
            ],
            fileList:[{
                "description":"smiles",
                "uploaded":true,
                "name":"sample2.smiles",
                "size":115,
                "type":"application/octet-stream",
                "url":"uploads/"    
            }]
             
        },
        metaLot_LotFirst: {
            lot:{
                "id": "1",
                "isVirtual":false,
                "chemist":{"id":2, "code": "cchemist", "name": "Corey Chemist","isChemist":true,"isAdmin":false},
                "project":{"code":"project3","id":3,"name":"Project 3","version":0},
                "corpName":"SGD-1234-C14Na-1",
                "asDrawnStruct":null,
                "lotMolWeight":"",
                "synthesisDate":"10/24/2011",
                "registrationDate":"09/14/2012",
                "color":"blue",
                "physicalState":{"id":3, "code": "gel", "name": "gel"},
                "notebookPage":"1111-223",
                "amount":"42",
                "amountUnits":{"id":1, "code": "mg", "name": "mg"},
	            "solutionAmountUnits": {"id":1, "code": "mL", "name": "mL"},
	            "vendor": {"id":1, "code": "Araxes", "name": "Araxes"},
                "retain":"2",
                "retainUnits":{"id":2, "code": "g", "name": "g"},
                "supplier":"jmco",
                "supplierID":"jmco1111",
                "purity":"92",
                "purityMeasuredBy":{"id":2, "code": "NMR", "name": "NMR"},
                "purityOperator":{"id":3, "code": ">", "name": ">"},
                "percentEEOperator":{"id":3, "code": ">", "name": ">"},
                "percentEE":"42",
                "comments":"i like it",
                "parent":{
                    "stereoCategoryCode":"scalemic",
                    "stereoComment":"comment",
                    "commonName":"comname",
                    "molWeight": 42.42345,
                    "molFormula": "C2H6",
                    "molStructure":"CC[C@H](C)C(CCCCCCNC(C)(C)OC(=O)OC(=O)OC(C)(C)C)[C@@H](CC(=O)C1=C(C(C)C)C(CCC[C@@H](CC2=CC=CC=C2)C(=O)OC)=CC=C1)OC",
                    "corpName":"SGD-0001",
                    "id":1,
                    "chemist":{"id":2, "code": "cchemist", "name": "Corey Chemist","isChemist":true,"isAdmin":false}
                    },
                "saltForm":{
                    "chemist":{"id":2, "code": "cchemist", "name": "Corey Chemist","isChemist":true,"isAdmin":false},
                    "corpName":"SGD-0001-C14Na",
                    "casNumber":"00010000",
                    "id":1,
                    "molStructure":"\n  Marvin  09141115532D          \n\n  2  1  0  0  0  0            999 V2000\n    0.8250    0.0000    0.0000 C   0  0  0  0  0  0  0  0  0  0  0  0\n    0.0000    0.0000    0.0000 C   0  0  0  0  0  0  0  0  0  0  0  0\n  1  2  4  0  0  0  0\nM  END\n$$$$\n"
                    }
            },
            isosalts:[   
                {
                    "isotope":{"name":"C14","abbrev":"C14","massChange":2,"id":1},
                    "equivalents":1,
                    "type":"isotope",
                    "id":1
                },
                {
                    "salt":{"name":"Na","abbrev":"Na","molStructure":"mol string 1","id":2},
                    "equivalents":2,
                    "type":"salt",
                    "id":2
                }
            ],
            fileList:[{
                "description":"smiles",
                "uploaded":true,
                "name":"sample2.smiles",
                "size":115,
                "type":"application/octet-stream",
                "url":"uploads/"    
            }]
             
        }
        
	};

	window.step2JSON = {
        asDrawnImage: "iVBORw0KGgoAAAANSUhEUgAAAlgAAAEsCAYAAAAfPc2WAAAD72lDQ1BJQ0NQcm9maWxlAAB4nI1V3W/bVBQ/iW9cpBY/oLGODhWLr1VTW7kbGq3GBkmTpelCGrnN2CqkyXVuGlPXNrbTbVWf9gJvDPgDgLIHHpB4QhoMxPay7QG0SVNBFdUkpD102kBok/aCqnCur1O7Xca4ka9/Oed3Pu/RNUDHV5rjmEkZYN7yXTWfkY+fmJY7ViEJz0En9ECnpntOulwuAi7GhUfWw18hwd43B9rr/3N1VqmnAySeQmxXPX0e8WmAlKk7rg8g3kb58CnfQdzxPOIdLiaIWGF4luMswzMcHw84U+ooYpaLpNe1KuIlxP0zMflsDPMcgrUjTy3qGrrMelF27Zph0li6T1D/zzVvNlrxevHp8uYmj+K7j9Ved8fUEH+ua7lJxC8jvub4GSZ/FfG9xlwljXgvQPKZmnukwvnJNxbrU+8g3om4aviFqVC+aM2UJrhtcnnOPqqGnGu6N4o9gxcR36rTQpHnI0CVZnOsX4h7642x0L8w7i1M5lp+FuujJe5HcN/TxsuIexB/6NrqBM9ZWKZmXuX+hSuOXw5zENYts1TkPolEvaDGQO7Xp8a4LTng4yFyWzJdM44UQv6SYwaziLmR825DrYScG5qby3M/5D61KqHP1K6qlmW9HUR8GI4lNKBgwwzuOliwATKokIcMvh1wUVMDA0yUUNRSlBiJp2EOZe155YDDccSYDazXmTVGac/hEe6EHJt0E4Xsx+cgKZJDZJiMgEzeJG+RwySL0hFycNO2HIvPYt3Z9PM+NNAr4x2DzLmeRl8U76x70tCvf/T3Fmv7kZxpK594B8DDDrSYA/H6ry79sCvysUIuvHuz6+oSTDypv6nbqfXUCu6rqbWIkfo9tYa/VUhjbmaQ0Tw+RpCHF8sgXsNlfHzQcP8DeXaMtyVizTrXE2lYJ+gHpYclONsfSZXflD+VFeUL5bxyd1uX23ZJ+FT4VvhR+E74XvgZZOGScFn4SbgifCNcjJ3V4+dj8+yDelvVMk27XlMwpYy0W3pJykovSK9Ixcif1C0NSWPSHtTs3jy3eLx4LQacwL3V1faxOK+CWgNOBRV4QYctOLNt/kNr0kuGSGHb1A6zWW4xxJyYFdMgi3vFEXFIHGe4lZ+4B3UjuOe2TJ3+mApojBWvcyCYOjarzHoh0HlAfXraZxftqO2ccY3Zui/vU5TX5TR+qqhcsPTBflkzTTlQebJLPeou0OogsO8gv6IfqMH3LbHzeiTz3wY49BfeWTci2XQD4GsPoPu1SNaHd+KznwFcOKA33IXwzk8kfgHwavv38X9dGbybbjWbD/C+6vgEYOPjZvOf5WZz40v0vwZwyfwXWQBxeO6COJEAAAoeaVRYdFhNTDpjb20uYWRvYmUueG1wAAAAAAA8P3hwYWNrZXQgYmVnaW49Iu+7vyIgaWQ9Ilc1TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI/Pgo8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5zOm1ldGEvIiB4OnhtcHRrPSJYTVAgQ29yZSA0LjQuMCI+CiAgIDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+CiAgICAgIDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiCiAgICAgICAgICAgIHhtbG5zOnRpZmY9Imh0dHA6Ly9ucy5hZG9iZS5jb20vdGlmZi8xLjAvIj4KICAgICAgICAgPHRpZmY6Q29tcHJlc3Npb24+MTwvdGlmZjpDb21wcmVzc2lvbj4KICAgICAgICAgPHRpZmY6T3JpZW50YXRpb24+MTwvdGlmZjpPcmllbnRhdGlvbj4KICAgICAgICAgPHRpZmY6UGhvdG9tZXRyaWNJbnRlcnByZXRhdGlvbj4yPC90aWZmOlBob3RvbWV0cmljSW50ZXJwcmV0YXRpb24+CiAgICAgIDwvcmRmOkRlc2NyaXB0aW9uPgogICA8L3JkZjpSREY+CjwveDp4bXBtZXRhPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg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",
        asDrawnMolWeight: 42.3456,
        asDrawnMolFormula: 'C2',
        parents: [
            {
                id: 1,
                corpName: 'SGD-0001',
                stereoCategory: {"id":1, "code": "scalemic", "name": "Scalemic"},
                stereoComment: "comment",
                commonName: 'comname 1',
                molWeight: 42.42345,
                molFormula: "C2H6",
                molStructure: "CC[C@H](C)C(CCCCCCNC(C)(C)OC(=O)OC(=O)OC(C)(C)C)[C@@H](CC(=O)C1=C(C(C)C)C(CCC[C@@H](CC2=CC=CC=C2)C(=O)OC)=CC=C1)OC",
                saltForms: [
                    {
                    id: 1,
                    corpName: "SGD-0001-C14Na",
                    "isosalts":[
                        {"id":1, "isotope":{id: 1, "name":"C14","abbrev":"C14","massChange":2},"equivalents":1,"type":"isotope"},
                        {"id":2, "salt":{id: 2, "name":"Na","abbrev":"Na","molStructure":"mol string 1"},"equivalents":2,"type":"salt"}
                        ],
                    "casNumber":"00010000",
                    "molStructure": "\n  Marvin  09141115532D          \n\n  2  1  0  0  0  0            999 V2000\n    0.8250    0.0000    0.0000 C   0  0  0  0  0  0  0  0  0  0  0  0\n    0.0000    0.0000    0.0000 C   0  0  0  0  0  0  0  0  0  0  0  0\n  1  2  4  0  0  0  0\nM  END\n$$$$\n"
                    },
                    {
                    id: 2,
                    corpName: "SGD-0001-Na",
                    "isosalts":[
                        {"id":3, "salt":{id: 2, "name":"Na","abbrev":"Na","molStructure":"mol string 1"},"equivalents":1,"type":"salt"}
                        ],
                    "casNumber":"00010000a",
                    "molStructure": "\n  Marvin  09141115532D          \n\n  2  1  0  0  0  0            999 V2000\n    0.8250    0.0000    0.0000 C   0  0  0  0  0  0  0  0  0  0  0  0\n    0.0000    0.0000    0.0000 C   0  0  0  0  0  0  0  0  0  0  0  0\n  1  2  4  0  0  0  0\nM  END\n$$$$\n"
                    }
                ]
            },
            {
                id: 2,
                corpName: 'SGD-0002',
                stereoCategory: {"id":2, "code": "racemic", "name": "Racemic"},
                stereoComment: "",
                commonName: 'comname 2',
                molStructure: "CC[C@H](C)C(CCCCCCNC(C)(C)OC(=O)OC(=O)OC(C)(C)C)[C@@H](CC(=O)C1=C(C(C)C)C(CCC[C@@H](CC2=CC=CC=C2)C(=O)OC)=CC=C1)OC",
                saltForms: [
                    {
                    id: 3,
                    corpName: "SGD-0002-Cl",
                    "isosalts":[
                        {"id":4, "salt":{id: 3, "name":"Cl","abbrev":"Cl","molStructure":"mol string 1"},"equivalents":2.5,"type":"salt"}
                        ],
                    "casNumber":"00020000",
                    "molStructure": "\n  Marvin  09141115532D          \n\n  2  1  0  0  0  0            999 V2000\n    0.8250    0.0000    0.0000 C   0  0  0  0  0  0  0  0  0  0  0  0\n    0.0000    0.0000    0.0000 C   0  0  0  0  0  0  0  0  0  0  0  0\n  1  2  4  0  0  0  0\nM  END\n$$$$\n"
                    }
                ]
            }
        ]

	
	};
    
    window.searchResultJSON =[
        {"corpName":"SGD-1234-Na",
            "stereoCategoryName":"Racemic",
            "stereoComment":"rac comment",
            "lotIDs":[
                {"corpName":"SGD-1234-Na-01","lotNumber":1, "registrationDate": "10/24/2011", "synthesisDate": "11/24/2011"},
                {"corpName":"SGD-1234-Na-02","lotNumber":2, "registrationDate": "10/25/2011", "synthesisDate": "11/25/2011"},
                {"corpName":"SGD-1234-Na-03","lotNumber":3, "registrationDate": "10/26/2011", "synthesisDate": "11/26/2011"},
                {"corpName":"SGD-1234-Na-05","lotNumber":5, "registrationDate": "10/27/2011", "synthesisDate": "11/27/2011"}
            ],
            "molStructure":"CC[C@H](C)C(CCCCCCNC(C)(C)OC(=O)OC(=O)OC(C)(C)C)[C@@H](CC(=O)C1=C(C(C)C)C(CCC[C@@H](CC2=CC=CC=C2)C(=O)OC)=CC=C1)OC"
        },
        {"corpName":"SGD-1234-Cl",
            "stereoCategoryName":"Racemic",
            "stereoComment":"st comm",
            "lotIDs":[
                {"corpName":"SGD-1234-Cl-01","lotNumber":1, "registrationDate": "11/1/2011", "synthesisDate": "12/1/2011"},
                {"corpName":"SGD-1234-Cl-02","lotNumber":2, "registrationDate": "11/2/2011", "synthesisDate": "12/2/2011"},
                {"corpName":"SGD-1234-Cl-03","lotNumber":3, "registrationDate": "11/3/2011", "synthesisDate": "12/3/2011"}
            ],
            "molStructure":"C1=CC2=CC3=CC4=CC5=CC6=C(C=CC=C6)C=C5C=C4C=C3C=C2C=C1 |c:0,12,14,17,20,23,26,29,t:2,4,6,8,10|"
        },
        {"corpName":"SGD-1234-C14",
            "stereoCategoryName":"Scalemic",
            "stereoComment":"",
            "lotIDs":[
                {"corpName":"SGD-1234-C14-01","lotNumber":1, "registrationDate": "11/4/2011", "synthesisDate": "12/4/2011"},
                {"corpName":"SGD-1234-C14-02","lotNumber":2, "registrationDate": "11/5/2011", "synthesisDate": "12/5/2011"}
            ],
            "molStructure":"N1C=CC2=C1NC1=C2C2=C(N1)NC1=C2C2=C(NC=C2)N1 |c:1,3,7,15,21,t:18|"
        },
        {"corpName":"SGD-2222-K",
            "stereoCategoryName":"See Comment",
            "stereoComment":"lots of centers",
            "lotIDs":[
                {"corpName":"SGD-2222-K-01","lotNumber":1, "registrationDate": "11/6/2011", "synthesisDate": "12/6/2011"}
            ],
            "molStructure":"C1CC2CC3CC4CC5C(CC6CC7CC8CCCC8C7C56)C4C3C2C1"
        }        
    ]



});