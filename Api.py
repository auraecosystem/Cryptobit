import requests


def upload_file(api_key, file_name, file_data):
    api_key_string = 'Key %s' % api_key
    auth_header = {'Authorization': api_key_string}
    files = {'file': (file_name, file_data)}
    r = requests.post('https://api.unpac.me/api/v1/private/upload', files=files, headers=auth_header)
    if not r.ok:
        # TODO: Add some error handling
        return None
    response = r.json()
    # Return the upload ID which can be used to get
    # the upload status
    return response['id']
