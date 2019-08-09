package ddit.template.mvc;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.AmazonS3Exception;
import com.amazonaws.services.s3.model.Bucket;
import org.junit.Test;
import static org.junit.Assert.*;

import java.util.List;


public class CreateBucketTest {
    public static Bucket getBucket(String bucket_name) {
        final AmazonS3 s3 = AmazonS3ClientBuilder.defaultClient();
        Bucket named_bucket = null;
        List<Bucket> buckets = s3.listBuckets();
        for (Bucket b : buckets) {
            if (b.getName().equals(bucket_name)) {
                named_bucket = b;
            }
        }
        return named_bucket;
    }

    @Test
    public void creteBucket() {
        final AmazonS3 s3 = AmazonS3ClientBuilder.defaultClient();
        Bucket b = null;
        if (s3.doesBucketExistV2("finalproject001")) {
//            System.out.format("Bucket %s already exists.\n", "finalproject001");
            b = getBucket("finalproject001");
        } else {
            try {
                b = s3.createBucket("finalproject001");
            } catch (AmazonS3Exception e) {
                System.err.println(e.getErrorMessage());
            }
        }
        assertEquals("bucket creation failed...","finalproject001",b.getName());
    }
}
