"""
Script para limpar logs com mais de 24 horas automaticamente.
Deve ser executado antes dos testes.
"""

import os
import time
from pathlib import Path

def cleanup_old_logs(logs_dir="results", hours=24):
    """
    Remove arquivos de log mais antigos que o período especificado em horas.
    
    Args:
        logs_dir (str): Diretório contendo os logs
        hours (int): Número de horas para considerar um log como antigo
    """
    
    if not os.path.exists(logs_dir):
        print(f"Diretório {logs_dir} não encontrado. Nenhum log foi deletado.")
        return
    
    # Converter horas em segundos
    time_limit = time.time() - (hours * 3600)
    
    # Extensões de arquivos de log a serem deletados
    log_extensions = ['.html', '.xml', '.txt', '.log']
    
    deleted_files = []
    
    try:
        for root, dirs, files in os.walk(logs_dir):
            for file in files:
                file_path = os.path.join(root, file)
                
                # Verificar se é um arquivo de log
                if any(file.endswith(ext) for ext in log_extensions):
                    # Obter o tempo de modificação do arquivo
                    file_mtime = os.path.getmtime(file_path)
                    
                    # Se o arquivo é mais antigo que o limite, deletar
                    if file_mtime < time_limit:
                        try:
                            os.remove(file_path)
                            deleted_files.append(file_path)
                            print(f"✓ Deletado: {file_path}")
                        except OSError as e:
                            print(f"✗ Erro ao deletar {file_path}: {e}")
        
        if deleted_files:
            print(f"\n{len(deleted_files)} arquivo(s) de log antigo(s) foi/foram removido(s).")
        else:
            print("Nenhum arquivo de log antigo encontrado.")
            
    except Exception as e:
        print(f"Erro durante a limpeza de logs: {e}")


if __name__ == "__main__":
    cleanup_old_logs()
