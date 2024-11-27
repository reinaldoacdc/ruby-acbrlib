require 'ffi'

# Carregando a biblioteca ACBrLib
module ACBrLib
  extend FFI::Library
  ffi_lib "/usr/lib64/libacbrnfse64.so"

  # Declarando uma função exemplo da ACBrLib
  attach_function :NFSE_Inicializar, [:string], :int
  attach_function :NFSE_Finalizar, [:pointer], :int
  attach_function :NFSE_Emitir, [:string, :int, :bool, :pointer, :int], :int
  attach_function :NFSE_ConfigGravarValor, [:string, :string, :string], :int

end

result = ACBrLib.NFSE_Inicializar('')

if result == 0
  puts "Inicialização da ACBrNFSe bem-sucedida!"
else
  puts "Erro ao inicializar a ACBrNFSe."
end

ACBrLib.NFSE_ConfigGravarValor("Principal", "TipoResposta", "2");
ACBrLib.NFSE_ConfigGravarValor("Principal", "LogPath", "./");
ACBrLib.NFSE_ConfigGravarValor("Principal", "LogNivel", "4");
ACBrLib.NFSE_ConfigGravarValor("NFSe", "LayoutNFSe", "0");


#sResp = FFI::MemoryPointer.new(:char, 4096)
sResp = FFI::MemoryPointer.new(:pointer, 4096)

result = ACBrLib.NFSE_Emitir("55", 0, false, sResp, 4096)
if result == 0
  puts " ==== Emitido com sucesso ==="
else
  puts "pointer #{sResp.size} "
  puts " **** Emitido com Erros: #{result} - #{sResp.read_string} ****"
end


result = ACBrLib.NFSE_Finalizar('')

if result == 0
  puts "Finalizado ACBrNFSe com sucesso"
else
  puts "Erro ao finalizar a ACBrNFSe."
end
