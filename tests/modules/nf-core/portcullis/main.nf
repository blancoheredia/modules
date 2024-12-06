#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { PORTCULLIS    } from '../../../../modules/nf-core/portcullis/main.nf'

workflow test_portcullis {

    input       = [ [ id:'test', single_end:false ], // meta map
                    file(params.test_data['homo_sapiens']['illumina']['test_paired_end_bam'], checkIfExists: true)]
    bed         = [ [id:'bed'],file(params.test_data['homo_sapiens']['genome']['genome_bed'], checkIfExists: true) ]
    fasta       = [ [id:'fasta'],file(params.test_data['homo_sapiens']['genome']['genome_fasta'], checkIfExists: true) ]

    PORTCULLIS  ( input, fasta, bed )
}
