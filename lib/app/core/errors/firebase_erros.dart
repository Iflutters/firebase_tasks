class FirebaseErros {

  static String error(String errorCode) {
    const Map<String, String> errorMessages = {
      'claims-too-large':
          'As declarações personalizadas excedem o limite de 1000 bytes.',
      'email-already-exists':
          'Este e-mail já está em uso. Use outro endereço de e-mail.',
      'id-token-expired': 'O token de autenticação expirou.',
      'id-token-revoked': 'O token de autenticação foi revogado.',
      'insufficient-permission':
          'Permissões insuficientes para realizar essa operação.',
      'internal-error':
          'Erro interno do servidor. Tente novamente mais tarde.',
      'invalid-argument': 'Argumento inválido fornecido.',
      'invalid-claims':
          'As declarações personalizadas fornecidas são inválidas.',
      'invalid-continue-uri':
          'A URL de confirmação fornecida é inválida.',
      'invalid-creation-time':
          'Data de criação inválida. Use um formato UTC válido.',
      'invalid-credential':
          'A credencial usada é inválida para essa ação.',
      'invalid-disabled-field':
          'O campo "disabled" deve ser verdadeiro ou falso.',
      'invalid-display-name':
          'O nome exibido fornecido é inválido.',
      'invalid-dynamic-link-domain':
          'O domínio do link dinâmico não está configurado.',
      'invalid-email': 'Endereço de e-mail inválido.',
      'invalid-email-verified':
          'O campo "emailVerified" deve ser verdadeiro ou falso.',
      'invalid-hash-algorithm': 'Algoritmo de hash inválido.',
      'invalid-hash-block-size': 'Tamanho de bloco de hash inválido.',
      'invalid-hash-derived-key-length':
          'Tamanho da chave derivada inválido.',
      'invalid-hash-key': 'Chave de hash inválida.',
      'invalid-hash-memory-cost': 'Custo de memória do hash inválido.',
      'invalid-hash-parallelization':
          'Paralelização de hash inválida.',
      'invalid-hash-rounds': 'Número de rounds do hash inválido.',
      'invalid-hash-salt-separator':
          'Separador de "salt" do hash inválido.',
      'invalid-id-token': 'Token de autenticação inválido.',
      'invalid-last-sign-in-time':
          'Último horário de login inválido.',
      'invalid-page-token':
          'Token de página inválido fornecido para listagem de usuários.',
      'invalid-password':
          'A senha deve conter pelo menos 6 caracteres.',
      'invalid-password-hash': 'Hash de senha inválido.',
      'invalid-password-salt': 'Salt de senha inválido.',
      'invalid-phone-number':
          'Número de telefone inválido. Use o formato +55...',
      'invalid-photo-url': 'URL da foto é inválido.',
      'invalid-provider-data': 'Dados do provedor inválidos.',
      'invalid-provider-id': 'ID do provedor inválido.',
      'invalid-oauth-responsetype':
          'Apenas um tipo de resposta OAuth pode ser verdadeiro.',
      'invalid-session-cookie-duration':
          'Duração do cookie de sessão inválida.',
      'invalid-uid': 'O UID precisa ter até 128 caracteres.',
      'invalid-user-import':
          'Os dados do usuário importado são inválidos.',
      'maximum-user-count-exceeded':
          'Número máximo de usuários excedido.',
      'missing-android-pkg-name':
          'Nome do pacote Android ausente.',
      'missing-continue-uri': 'URL de confirmação ausente.',
      'missing-hash-algorithm':
          'Algoritmo de hash ausente na importação.',
      'missing-ios-bundle-id':
          'Identificador de pacote iOS ausente.',
      'missing-uid': 'UID ausente para a operação atual.',
      'missing-oauth-client-secret':
          'Chave secreta do cliente OAuth ausente.',
      'operation-not-allowed':
          'Este método de login não está habilitado no projeto.',
      'phone-number-already-exists':
          'Este número de telefone já está em uso.',
      'project-not-found':
          'Projeto do Firebase não encontrado para a credencial informada.',
      'reserved-claims':
          'Foi usada uma chave reservada nas declarações personalizadas.',
      'session-cookie-expired':
          'O cookie de sessão expirou.',
      'session-cookie-revoked':
          'O cookie de sessão foi revogado.',
      'too-many-requests':
          'Muitas requisições. Tente novamente em breve.',
      'uid-already-exists':
          'O UID fornecido já está em uso.',
      'unauthorized-continue-uri':
          'O domínio da URL de confirmação não está autorizado.',
      'user-not-found':
          'Usuário não encontrado. Verifique os dados e tente novamente.',
    };

    return errorMessages[errorCode] ??
        'Erro desconhecido: $errorCode. Verifique o código ou tente novamente.';
  }
}
