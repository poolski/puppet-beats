define beats::package::apt (
  $component = $beats::package::component 
){
  package { $component:
    ensure   => installed,
  }
}
