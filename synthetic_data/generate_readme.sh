export s3_path=https://instruct-lab.s3.us-east.cloud-object-storage.appdomain.cloud
export files=$(find compositional_skills -type f -exec echo $s3_path/{} \;)
export model_filename=mistrial-7b

echo '
<!-- This README is generated by script. Please do not modify manually. -->
# Instruct Lab Synthetic Data

Synthetic data from the latest release are hosted on the Cloud at:
https://instruct-lab.s3.us-east.cloud-object-storage.appdomain.cloud/

> **_NOTE:_** Currently the full synthetic data is not yet available, it will be ready during the next model release.

To download a particular set of synthetic data, use the above link + the directory path + model filename + file extension as the URL link. Currently, the two file extensions are `.parquet` for full synthetic data and `.preview.json` to preview the first 10 examples in JSON. For example:

- The synthetic data for `compositional_skills/extraction/abstractive/abstract` using the `mistrial-7b` model:
  - Full synthetic data: https://instruct-lab.s3.us-east.cloud-object-storage.appdomain.cloud/compositional_skills/extraction/abstractive/abstract/mistrial-7b.parquet
  - Preview synthetic data in JSON: https://instruct-lab.s3.us-east.cloud-object-storage.appdomain.cloud/compositional_skills/extraction/abstractive/abstract/mistrial-7b.preview.json

The preview JSON file can be opened as it is. To open the parquet file with full synthetic data, use the following commands to install the Python libraries and load the parquet file into the Pandas data frame:
```bash
pip3 install pyarrow pandas
python3
```
  
```python
import pyarrow.parquet as pq
pq.read_pandas(mistrial-7b.parquet).to_pandas()
```
'

echo "### Full synthetic data links"
export full_data=${files//qna.yaml/$model_filename.parquet}
for i in ${full_data[@]}
do
   echo "- [$i]($i)"
done
echo "\n### Synthetic data preview links"
export preview_data=${files//qna.yaml/$model_filename.preview.json}
for i in ${preview_data[@]}
do
   echo "- [$i]($i)"
done

echo '
### Update This README
To update this readme, please use the following commands:

```bash
git clone https://github.com/instructlab/taxonomy
cd taxonomy
./synthetic_data/generate_readme.sh > ./synthetic_data/README.md
```
'