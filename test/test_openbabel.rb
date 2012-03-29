require 'test/unit'
require 'openbabel'
include OpenBabel

class OBTest < Test::Unit::TestCase
  def test_obmol
    # Code from http://goo.gl/9H1LZ

    smi2mol = OBConversion.new
    smi2mol.set_in_format("smi")

    mol = OBMol.new
    smi2mol.read_string(mol, 'CC(C)CCCC(C)C1CCC2C1(CCC3C2CC=C4C3(CCC(C4)O)C)C') # cholesterol, no chirality
    mol.add_hydrogens

    assert_equal(mol.num_atoms, 74)
    assert_in_delta(mol.get_mol_wt, 386.65, 0.1)
    assert_equal(mol.get_formula, "C27H46O")

  end
end
