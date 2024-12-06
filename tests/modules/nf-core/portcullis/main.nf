#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { PORTCULLIS    } from '../../../../modules/nf-core/portcullis/main.nf'

workflow test_portcullis {

    input       = [ [ id:'test' ], // meta map
                    file(params.test_data['homo_sapiens']['illumina']['test_paired_end_sorted_bam'], checkIfExists: true),
                    file(params.test_data['homo_sapiens']['illumina']['test_paired_end_sorted_bam_bai'], checkIfExists: true),
                    [],
                    [] ]
    fasta       = [ [id:'fasta'],file(params.test_data['homo_sapiens']['genome']['genome_fasta'], checkIfExists: true) ]
    bed         = [ [id:'bed'],file(params.test_data['homo_sapiens']['genome']['genome_annotation_bed'], checkIfExists: true) ]

    PORTCULLIS  ( input, fasta, bed )
}
