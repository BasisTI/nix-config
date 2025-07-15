{config, pkgs, ...}:
{
  # JDK
      # Erro: cycle detected in build of '/nix/store/pih5qinxqs3wbs2x8wjrnr39h8hp8yg2-openjdk-8u442-b06.drv' in the references of output 'jre' from output 'out
      #"jdks/openjdk8".source = pkgs.jdk8;
      "jdks/openjdk11".source = pkgs.jdk11;
      "jdks/openjdk17".source = pkgs.jdk17;
      "jdks/openjdk21".source = pkgs.jdk21;
  # NodeJS
      "node/nodejs_22".source = pkgs.nodejs_22;
      "node/nodejs_20".source = pkgs.nodejs_20;
}
