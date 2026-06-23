import argparse
import re

def rc4(key, data):
    """
    RC4 decryption implementation based on CryptBot's mw_rc4 function.
    Key: The encryption key (e.g., 'LkgwUi').
    Data: The encrypted blob as bytes.
    Returns: Decrypted data as a bytearray.
    """
    S = list(range(256))
    j = 0
    out = bytearray()

    # KSA (Key Scheduling Algorithm)
    for i in range(256):
        j = (j + S[i] + key[i % len(key)]) % 256
        S[i], S[j] = S[j], S[i]

    # PRGA (Pseudo-Random Generation Algorithm)
    i = j = 0
    for byte in data:
        i = (i + 1) % 256
        j = (j + S[i]) % 256
        S[i], S[j] = S[j], S[i]
        k = S[(S[i] + S[j]) % 256]
        out.append(byte ^ k)

    return out

def extract_config(binary_path, key_str='LkgwUi', blob_size=6500):
    """
    Extracts and decrypts the configuration from a CryptBot v3 binary.
    binary_path: Path to the binary file.
    key_str: RC4 key (default: 'LkgwUi').
    blob_size: Size of the encrypted blob (default: 6500).
    Returns: Decrypted configuration as a string or error message.
    """
    key = bytearray(key_str.encode('utf-8'))
    
    try:
        with open(binary_path, 'rb') as f:
            binary_data = f.read()
    except Exception as e:
        return f"Error reading binary file: {e}"

    # Search for the RC4 key in the binary
    key_pattern = re.escape(key_str).encode('utf-8')
    key_match = re.search(key_pattern, binary_data)
    
    if not key_match:
        return f"Error: RC4 key '{key_str}' not found in binary."

    # Locate the encrypted blob (0x00475960)
    blob_start = None
    try:
        base_address = 0x400000  # Typical PE base address
        target_offset = 0x00475960 - base_address
        if target_offset + blob_size <= len(binary_data):
            blob_start = target_offset
        else:
            blob_start = key_match.end() + 10  # Heuristic offset
    except:
        return "Error: Unable to determine blob offset."

    if blob_start + blob_size > len(binary_data):
        return "Error: Blob size exceeds binary length."

    # Extract and decrypt the blob
    encrypted_blob = binary_data[blob_start:blob_start + blob_size]
    decrypted = rc4(key, encrypted_blob)
    
    try:
        config = decrypted.decode('latin1').rstrip('\x00')
        config_lines = [line for line in config.split('\x00') if line]
        return '\n'.join(config_lines)
    except UnicodeDecodeError:
        return decrypted.hex()

def main():
    parser = argparse.ArgumentParser(description="CryptBot v3 Configuration Extractor")
    parser.add_argument("binary", help="Path to the CryptBot binary file")
    parser.add_argument("--key", default="LkgwUi", help="RC4 key (default: LkgwUi)")
    parser.add_argument("--size", type=int, default=6500, help="Size of encrypted blob (default: 6500)")
    args = parser.parse_args()

    config = extract_config(args.binary, args.key, args.size)
    print("Decrypted Configuration:")
    print(config)

if __name__ == "__main__":
    main()
