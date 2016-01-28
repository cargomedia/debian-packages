node default {

  if ! ($::lsbdistcodename == 'jessie') {
    class { 'apt::source::cargomedia': }
  }
}
