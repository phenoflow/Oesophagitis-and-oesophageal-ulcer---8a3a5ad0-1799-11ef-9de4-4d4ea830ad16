cwlVersion: v1.0
steps:
  read-potential-cases-omop:
    run: read-potential-cases-omop.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  oesophagitis-and-oesophageal-ulcer---primary:
    run: oesophagitis-and-oesophageal-ulcer---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-omop/output
  oesophagitis-and-oesophageal-ulcer-reflux---primary:
    run: oesophagitis-and-oesophageal-ulcer-reflux---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: oesophagitis-and-oesophageal-ulcer---primary/output
  oesophagitis-and-oesophageal-ulcer-oesophagu---primary:
    run: oesophagitis-and-oesophageal-ulcer-oesophagu---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: oesophagitis-and-oesophageal-ulcer-reflux---primary/output
  oesophagitis---primary:
    run: oesophagitis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: oesophagitis-and-oesophageal-ulcer-oesophagu---primary/output
  chemical-oesophagitis-and-oesophageal-ulcer---primary:
    run: chemical-oesophagitis-and-oesophageal-ulcer---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: oesophagitis---primary/output
  peptic-oesophagitis-and-oesophageal-ulcer---primary:
    run: peptic-oesophagitis-and-oesophageal-ulcer---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: chemical-oesophagitis-and-oesophageal-ulcer---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: peptic-oesophagitis-and-oesophageal-ulcer---primary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
